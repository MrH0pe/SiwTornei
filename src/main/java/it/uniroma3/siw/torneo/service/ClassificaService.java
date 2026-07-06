package it.uniroma3.siw.torneo.service;

import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.uniroma3.siw.torneo.model.Partita;
import it.uniroma3.siw.torneo.model.Squadra;
import it.uniroma3.siw.torneo.model.StatoPartita;
import it.uniroma3.siw.torneo.model.Torneo;

@Service
public class ClassificaService {

	private PartitaService partitaService;
	
	public ClassificaService( PartitaService partitaService) {
		this.partitaService = partitaService;
	}
	
	@Transactional
	public Map<Squadra, Integer> classificaTorneo(Torneo torneo) {
	    Map<Squadra, Integer> classifica = new HashMap<>();

	    List<Squadra> squadreTorneo = torneo.getSquadre();
	    
	    for (Squadra squadra : squadreTorneo) {
	        classifica.put(squadra, 0);
	    }

	    List<Partita> partite = partitaService.findAllByTorneo(torneo);
	    for (Partita partita : partite) {
	        if (partita.getStato() == StatoPartita.PLAYED) {
	            Squadra casa = partita.getSquadraCasa();
	            Squadra ospite = partita.getSquadraOspite();
	            classifica.putIfAbsent(casa, 0);
	            classifica.putIfAbsent(ospite, 0);
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
	        }
	    }
	    return classifica.entrySet().stream()
	        .sorted(Map.Entry.comparingByValue(Comparator.reverseOrder()))
	        .collect(Collectors.toMap(
	            Map.Entry::getKey,
	            Map.Entry::getValue,
	            (e1, e2) -> e1,
	            LinkedHashMap::new));
	}
}
