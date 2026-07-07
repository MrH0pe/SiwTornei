# Analisi sperimentale delle strategie di accesso ai dati

*(Sezione 8.2 del progetto — confronto tra strategie di fetch in JPA/Hibernate)*

## 1. Obiettivo

Confrontare, su due casi d'uso reali dell'applicazione, le prestazioni di diverse strategie di accesso ai dati:

- **LAZY** (default JPA per le collezioni `@OneToMany` / `@ManyToMany`)
- **EAGER** (default JPA per le associazioni `@ManyToOne` / `@OneToOne`)
- **JOIN FETCH** (JPQL)
- **EntityGraph** (`@EntityGraph` di Spring Data JPA)

e misurare l'impatto del **problema N+1 query**.

## 2. Casi d'uso analizzati

**Caso A — Dettaglio di un torneo con le squadre partecipanti** (`GET /tornei/{id}`).
L'associazione `Torneo.squadre` è `@ManyToMany`, quindi LAZY di default: con `findById()` Hibernate carica solo il torneo, e il primo accesso a `getSquadre()` scatena una seconda query.

**Caso B — Calendario delle partite di un torneo** (`GET /tornei/{id}` e classifica).
Le associazioni di `Partita` (`torneo`, `squadraCasa`, `squadraOspite`, `arbitro`) sono `@ManyToOne`, quindi EAGER di default: `findAllByTorneo()` esegue 1 query per le partite più query aggiuntive per risolvere le associazioni di ogni riga → **problema N+1**.

## 3. Metodologia

- Codice: [`AnalisiPrestazioniService`](src/main/java/it/uniroma3/siw/torneo/service/AnalisiPrestazioniService.java) e [`AnalisiPrestazioniRunner`](src/main/java/it/uniroma3/siw/torneo/AnalisiPrestazioniRunner.java).
- Dati di prova generati automaticamente: **1 torneo, 30 squadre, 300 partite** (rimossi a fine esperimento).
- Per ogni strategia: **10 esecuzioni di warm-up** (non misurate, per stabilizzare JIT e connection pool) e **50 esecuzioni misurate** con `System.nanoTime()`.
- Ogni esecuzione avviene in una **transazione separata** (`@Transactional(readOnly = true)`): il persistence context è vuoto a ogni misura, quindi la cache di primo livello non falsa i risultati tra un'esecuzione e l'altra.
- `spring.jpa.show-sql` disattivato durante le misure per non includere il costo dell'I/O di log.

Come eseguire l'esperimento:

```
./mvnw spring-boot:run -Dspring-boot.run.profiles=benchmark "-Dspring-boot.run.arguments=--spring.jpa.show-sql=false"
```

## 4. Risultati

Ambiente: Windows 11, PostgreSQL 18 locale (localhost:5433), Java 17, Spring Boot 3.5.16.

### Caso A — Dettaglio torneo con squadre (1 torneo, 30 squadre)

| Strategia | Query SQL | Media (ms) | Min (ms) |
|---|---|---|---|
| LAZY (default) | 2 (torneo + squadre) | 1,270 | 0,721 |
| **JOIN FETCH** | **1** | **0,845** | **0,562** |
| EntityGraph | 1 (con LEFT JOIN) | 2,110 | 1,270 |

### Caso B — Calendario partite di un torneo (300 partite + associazioni)

| Strategia | Query SQL | Media (ms) | Min (ms) |
|---|---|---|---|
| EAGER default (N+1) | 1 + ~32 (una per ogni entità associata distinta) | 10,833 | 7,954 |
| JOIN FETCH | 1 | 8,898 | 5,455 |
| **EntityGraph** | **1** | **8,586** | **6,261** |

## 5. Discussione

**Caso A.** Il `JOIN FETCH` è la strategia più veloce (~33% meglio del LAZY in media): elimina il round-trip aggiuntivo verso il database caricando torneo e squadre in una singola query con join. L'`EntityGraph`, pur generando anch'esso una sola query, è risultato il più lento su questo caso: la query generata da Hibernate include tutte le colonne delle entità in join e la deduplicazione delle righe ha un overhead che, su un risultato così piccolo (30 righe), supera il risparmio del round-trip evitato.

**Caso B.** Il problema N+1 è evidente: con la strategia EAGER di default, oltre alla query per le 300 partite, Hibernate esegue una query per ogni entità associata *distinta* non ancora presente nel persistence context (~30 squadre + 1 arbitro + 1 torneo). Il divario (≈ +26% in media, ≈ +45% sul minimo rispetto all'EntityGraph) sarebbe molto più ampio se le entità associate fossero tutte diverse tra loro (nel caso peggiore: 4 query per ognuna delle 300 partite = 1201 query) o se il database non fosse in locale: **ogni query aggiuntiva è un round-trip di rete**, quindi con una latenza realistica di rete il costo dell'N+1 cresce linearmente con il numero di righe. `JOIN FETCH` ed `EntityGraph` risolvono il problema con una singola query e risultano sostanzialmente equivalenti.

**Osservazione sul LAZY.** Il LAZY resta comunque la scelta corretta come default sulle collezioni: carica i dati solo se servono. Il punto non è "LAZY vs EAGER" in assoluto, ma scegliere **per ogni caso d'uso** la strategia giusta: quando si sa già che la collezione verrà usata (dettaglio torneo, calendario, classifica), conviene una fetch query dedicata.

## 6. Scelte implementative conseguenti

- `TorneoRepository.findByIdWithSquadre()` (JOIN FETCH) è usato nel dettaglio torneo, nella classifica e nella gestione squadre-torneo.
- `SquadraRepository.findByIdWithGiocatori()` (JOIN FETCH) è usato nel dettaglio squadra.
- `PartitaRepository.findAllByTorneoWithRelazioni()` e `findAllWithRelazioni()` (JOIN FETCH) sono usati nel calendario del torneo, nella classifica e nella lista partite dell'admin, eliminando l'N+1 dovuto ai `@ManyToOne` EAGER.
- `spring.jpa.open-in-view=false`: il caricamento LAZY fuori transazione fallisce esplicitamente invece di generare query nascoste durante il rendering della vista.
