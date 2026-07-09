package it.uniroma3.siw.torneo;

import java.util.function.LongSupplier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Component;

import it.uniroma3.siw.torneo.service.AnalisiPrestazioniService;

/*
 * Esperimento richiesto dalla Sezione 8.2 del progetto.
 *
 * Si attiva SOLO con il profilo "benchmark":
 *    ./mvnw spring-boot:run -Dspring-boot.run.profiles=benchmark
 * (con il profilo attivo l'applicazione parte normalmente: i risultati vengono stampati in console)
 *
 * Metodologia:
 *  - dati di prova: 1 torneo, 30 squadre, 300 partite (creati e poi rimossi automaticamente)
 *  - 10 esecuzioni di riscaldamento (warm-up di JIT e connection pool), non misurate
 *  - 50 esecuzioni misurate con System.nanoTime(); si riportano media e minimo
 *  - ogni esecuzione avviene in una transazione separata (persistence context vuoto,
 *    quindi nessun effetto della cache di primo livello tra un'esecuzione e l'altra)
 */
@Component
@Profile("benchmark")
public class AnalisiPrestazioniRunner implements ApplicationRunner {

	private static final int WARMUP = 10;
	private static final int MISURE = 50;

	@Autowired
	private AnalisiPrestazioniService analisi;

	@Override
	public void run(ApplicationArguments args) {
		System.out.println("\n================ ANALISI SPERIMENTALE STRATEGIE DI FETCH ================");
		Long torneoId = analisi.creaDatiDiProva();
		System.out.println("Dati di prova: torneo id=" + torneoId + " (30 squadre, 300 partite)\n");

		try {
			System.out.println("CASO A — Dettaglio torneo con squadre (1 torneo, 30 squadre)");
			misura("LAZY (default)      ", () -> analisi.misuraTorneoLazy(torneoId));
			misura("JOIN FETCH          ", () -> analisi.misuraTorneoJoinFetch(torneoId));
			misura("EntityGraph         ", () -> analisi.misuraTorneoEntityGraph(torneoId));

			System.out.println("\nCASO B — Calendario partite di un torneo (300 partite + associazioni)");
			misura("EAGER default (N+1) ", () -> analisi.misuraPartiteEagerDefault(torneoId));
			misura("JOIN FETCH          ", () -> analisi.misuraPartiteJoinFetch(torneoId));
			misura("EntityGraph         ", () -> analisi.misuraPartiteEntityGraph(torneoId));
		} finally {
			analisi.eliminaDatiDiProva(torneoId);
			System.out.println("\nDati di prova rimossi.");
			System.out.println("==========================================================================\n");
		}
	}

	//Esegue il warm-up, poi le misure, e stampa media e minimo in millisecondi
	private void misura(String etichetta, LongSupplier esecuzione) {
		for (int i = 0; i < WARMUP; i++)
			esecuzione.getAsLong();

		long somma = 0, minimo = Long.MAX_VALUE;
		for (int i = 0; i < MISURE; i++) {
			long t = esecuzione.getAsLong();
			somma += t;
			if (t < minimo) minimo = t;
		}
		System.out.printf("  %s  media: %8.3f ms   min: %8.3f ms   (%d esecuzioni)%n",
				etichetta, somma / (double) MISURE / 1_000_000.0, minimo / 1_000_000.0, MISURE);
	}
}
