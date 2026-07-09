package it.uniroma3.siw.torneo.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.uniroma3.siw.torneo.model.Arbitro;
import it.uniroma3.siw.torneo.model.Partita;
import it.uniroma3.siw.torneo.model.Squadra;
import it.uniroma3.siw.torneo.model.StatoPartita;
import it.uniroma3.siw.torneo.model.Torneo;
import it.uniroma3.siw.torneo.repository.ArbitroRepository;
import it.uniroma3.siw.torneo.repository.PartitaRepository;
import it.uniroma3.siw.torneo.repository.SquadraRepository;
import it.uniroma3.siw.torneo.repository.TorneoRepository;

/*
 * Service per l'analisi sperimentale delle strategie di accesso ai dati (Sezione 8.2 del progetto).
 *
 * Confronta, sullo stesso caso d'uso, tre strategie:
 *   1. LAZY (default JPA per le collezioni): 1 query per l'entità + 1 query al primo accesso alla collezione
 *   2. JOIN FETCH (JPQL): una singola query con join
 *   3. EntityGraph: equivalente dichiarativo del join fetch
 * e, per la lista partite, il default EAGER dei @ManyToOne (che genera il problema N+1)
 * contro il JOIN FETCH e l'EntityGraph.
 *
 * Ogni metodo di misura apre la propria transazione (readOnly): così ogni esecuzione
 * parte con un persistence context vuoto e le misure non sono falsate dalla cache di primo livello.
 */
@Service
public class AnalisiPrestazioniService {

	@Autowired
	private TorneoRepository torneoRepository;

	@Autowired
	private SquadraRepository squadraRepository;

	@Autowired
	private PartitaRepository partitaRepository;

	@Autowired
	private ArbitroRepository arbitroRepository;

	// ==================== CASO A: dettaglio torneo con squadre ====================

	//Strategia 1: LAZY -> findById() carica solo il torneo; l'accesso a getSquadre() scatena la seconda query
	@Transactional(readOnly = true)
	public long misuraTorneoLazy(Long torneoId) {
		long inizio = System.nanoTime();
		Torneo torneo = torneoRepository.findById(torneoId).orElseThrow();
		torneo.getSquadre().size(); //forza l'inizializzazione della collezione LAZY
		return System.nanoTime() - inizio;
	}

	//Strategia 2: JOIN FETCH -> una sola query SQL con join
	@Transactional(readOnly = true)
	public long misuraTorneoJoinFetch(Long torneoId) {
		long inizio = System.nanoTime();
		Torneo torneo = torneoRepository.findByIdWithSquadre(torneoId).orElseThrow();
		torneo.getSquadre().size();
		return System.nanoTime() - inizio;
	}

	//Strategia 3: EntityGraph -> join generata da Hibernate sugli attributi dichiarati
	@Transactional(readOnly = true)
	public long misuraTorneoEntityGraph(Long torneoId) {
		long inizio = System.nanoTime();
		Torneo torneo = torneoRepository.findByIdWithSquadreEntityGraph(torneoId).orElseThrow();
		torneo.getSquadre().size();
		return System.nanoTime() - inizio;
	}

	// ==================== CASO B: calendario partite di un torneo ====================

	//Strategia 1: default EAGER dei @ManyToOne -> problema N+1
	//(1 query per le partite + query aggiuntive per torneo/squadre/arbitro di ogni riga)
	@Transactional(readOnly = true)
	public long misuraPartiteEagerDefault(Long torneoId) {
		long inizio = System.nanoTime();
		Torneo torneo = torneoRepository.findById(torneoId).orElseThrow();
		List<Partita> partite = partitaRepository.findAllByTorneo(torneo);
		for (Partita p : partite) { //accesso alle associazioni, come farebbe il template Thymeleaf
			p.getSquadraCasa().getNome();
			p.getSquadraOspite().getNome();
			p.getArbitro().getCognome();
		}
		return System.nanoTime() - inizio;
	}

	//Strategia 2: JOIN FETCH -> tutte le associazioni in una sola query
	@Transactional(readOnly = true)
	public long misuraPartiteJoinFetch(Long torneoId) {
		long inizio = System.nanoTime();
		Torneo torneo = torneoRepository.findById(torneoId).orElseThrow();
		List<Partita> partite = partitaRepository.findAllByTorneoWithRelazioni(torneo);
		for (Partita p : partite) {
			p.getSquadraCasa().getNome();
			p.getSquadraOspite().getNome();
			p.getArbitro().getCognome();
		}
		return System.nanoTime() - inizio;
	}

	//Strategia 3: EntityGraph
	@Transactional(readOnly = true)
	public long misuraPartiteEntityGraph(Long torneoId) {
		long inizio = System.nanoTime();
		Torneo torneo = torneoRepository.findById(torneoId).orElseThrow();
		List<Partita> partite = partitaRepository.findAllByTorneoWithEntityGraph(torneo);
		for (Partita p : partite) {
			p.getSquadraCasa().getNome();
			p.getSquadraOspite().getNome();
			p.getArbitro().getCognome();
		}
		return System.nanoTime() - inizio;
	}

	// ==================== DATI DI PROVA ====================

	public static final String NOME_TORNEO_BENCHMARK = "TORNEO-BENCHMARK";
	private static final int NUM_SQUADRE = 30;
	private static final int NUM_PARTITE = 300;

	//Crea (se assente) un torneo di prova con 30 squadre e 300 partite. Ritorna l'id del torneo.
	@Transactional
	public Long creaDatiDiProva() {
		if (torneoRepository.existsByNomeAndAnno(NOME_TORNEO_BENCHMARK, 2026)) {
			for (Torneo t : torneoRepository.findAll())
				if (NOME_TORNEO_BENCHMARK.equals(t.getNome())) return t.getId();
		}

		Torneo torneo = new Torneo();
		torneo.setNome(NOME_TORNEO_BENCHMARK);
		torneo.setAnno(2026);
		torneo.setDescrizione("Dati generati per l'analisi delle prestazioni");

		List<Squadra> squadre = new ArrayList<>();
		for (int i = 1; i <= NUM_SQUADRE; i++) {
			Squadra s = new Squadra();
			s.setNome("BM-Squadra-" + i);
			s.setCitta("Benchmarkville");
			s.setAnnoDiFondazione(1900 + i);
			squadre.add(squadraRepository.save(s));
		}
		torneo.setSquadre(squadre);
		torneo = torneoRepository.save(torneo);

		Arbitro arbitro = new Arbitro();
		arbitro.setNome("Mario");
		arbitro.setCognome("Benchmark");
		arbitro.setCodiceArbitrale("BM-REF-001");
		arbitro = arbitroRepository.save(arbitro);

		LocalDateTime base = LocalDateTime.of(2026, 1, 1, 15, 0);
		for (int i = 0; i < NUM_PARTITE; i++) {
			Partita p = new Partita();
			p.setDataOra(base.plusHours(i)); //dataOra diversa per rispettare il vincolo (dataOra, luogo)
			p.setLuogo("BM-Stadio");
			p.setTorneo(torneo);
			p.setSquadraCasa(squadre.get(i % NUM_SQUADRE));
			p.setSquadraOspite(squadre.get((i + 1) % NUM_SQUADRE));
			p.setArbitro(arbitro);
			p.setStato(StatoPartita.PLAYED);
			p.setGoalsHome(i % 5);
			p.setGoalsAway((i + 2) % 5);
			partitaRepository.save(p);
		}
		return torneo.getId();
	}

	//Rimuove i dati di prova per non sporcare il database dell'applicazione
	@Transactional
	public void eliminaDatiDiProva(Long torneoId) {
		Torneo torneo = torneoRepository.findById(torneoId).orElse(null);
		if (torneo == null) return;
		partitaRepository.deleteAll(partitaRepository.findAllByTorneo(torneo));
		torneo.getSquadre().clear(); //svuota la join table torneo_squadre
		torneoRepository.delete(torneo);
		for (Squadra s : squadraRepository.findAll())
			if ("Benchmarkville".equals(s.getCitta())) squadraRepository.delete(s);
		for (Arbitro a : arbitroRepository.findAll())
			if ("BM-REF-001".equals(a.getCodiceArbitrale())) arbitroRepository.delete(a);
	}
}
