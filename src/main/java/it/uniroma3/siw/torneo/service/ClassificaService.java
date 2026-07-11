package it.uniroma3.siw.torneo.service;

import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.uniroma3.siw.torneo.model.Partita;
import it.uniroma3.siw.torneo.model.Squadra;
import it.uniroma3.siw.torneo.model.StatoPartita;
import it.uniroma3.siw.torneo.model.Torneo;

@Service
public class ClassificaService {

	@Autowired
	private PartitaService partitaService;
	
	//Sola lettura
	@Transactional(readOnly = true)
	public Map<Squadra, Integer> classificaTorneo(Torneo torneo) {
	    Map<Squadra, Integer> classifica = new HashMap<>();
	    Map<Squadra, Integer> differenzaReti = new HashMap<>(); //criterio di spareggio a parità di punti

	    List<Squadra> squadreTorneo = torneo.getSquadre();  //Mette in questa List tutte le squadre del torneo
	    for (Squadra squadra : squadreTorneo) {
	        classifica.put(squadra, 0);                    //Inizializza la classifica con 0 punti per ogni squadra
	        differenzaReti.put(squadra, 0);				  //Inizializza la differenza di reti con 0 per ogni squadra
	    }

	    List<Partita> partite = partitaService.findAllByTorneoWithRelazioni(torneo);
	    for (Partita partita : partite) {
	        if (partita.getStato() == StatoPartita.PLAYED) {
	            Squadra casa = partita.getSquadraCasa();
	            Squadra ospite = partita.getSquadraOspite();
	            classifica.putIfAbsent(casa, 0);
	            classifica.putIfAbsent(ospite, 0);
	            differenzaReti.putIfAbsent(casa, 0);
	            differenzaReti.putIfAbsent(ospite, 0);
	            int gCasa = partita.getGoalsHome();
	            int gOspite = partita.getGoalsAway();

	            if (gCasa > gOspite) {
	                classifica.put(casa, classifica.get(casa) + 3);
	            } else if (gCasa < gOspite) {
	                classifica.put(ospite, classifica.get(ospite) + 3);
	            } else {
	                classifica.put(casa, classifica.get(casa) + 1);
	                classifica.put(ospite, classifica.get(ospite) + 1);
	            }
	            differenzaReti.put(casa, differenzaReti.get(casa) + gCasa - gOspite);
	            differenzaReti.put(ospite, differenzaReti.get(ospite) + gOspite - gCasa);
	        }
	    }
	    //Ordinamento: punti decrescenti, a parità di punti differenza reti decrescente
	    return classifica.entrySet().stream()
	        .sorted(Map.Entry.<Squadra, Integer>comparingByValue(Comparator.reverseOrder())
	            .thenComparing(entry -> differenzaReti.get(entry.getKey()), Comparator.reverseOrder()))
	        .collect(Collectors.toMap(
	            Map.Entry::getKey,
	            Map.Entry::getValue,
	            (e1, e2) -> e1,
	            LinkedHashMap::new));
	}
}
