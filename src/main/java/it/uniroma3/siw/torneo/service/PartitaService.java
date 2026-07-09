package it.uniroma3.siw.torneo.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import it.uniroma3.siw.torneo.model.Partita;
import it.uniroma3.siw.torneo.model.StatoPartita;
import it.uniroma3.siw.torneo.model.Torneo;
import it.uniroma3.siw.torneo.repository.PartitaRepository;

@Service
public class PartitaService {

	@Autowired
	private PartitaRepository partitaRepository;
	
	@Transactional(readOnly = true)
	public List<Partita> findAll(){
		return (List<Partita>) partitaRepository.findAll();
	}
	@Transactional(readOnly = true)
	public Partita findById(Long id) {
		return partitaRepository.findById(id).orElse(null);
	}
	
	@Transactional
	public void save(Partita partita) {
		partitaRepository.save(partita);
	}
	
	@Transactional
	public void delete(Partita partita) {
		partitaRepository.delete(partita);
	}
	
	@Transactional(readOnly = true)
	public boolean existsByLuogoAndDataOra(String luogo, LocalDateTime dataOra) {
		return partitaRepository.existsByLuogoAndDataOra(luogo, dataOra);
	}

	//Lista partite con tutte le associazioni in una sola query (evita il problema N+1)
	@Transactional(readOnly = true)
	public List<Partita> findAllWithRelazioni(){
		return partitaRepository.findAllWithRelazioni();
	}

	@Transactional(readOnly = true)
	public List<Partita> findAllByTorneoWithRelazioni(Torneo torneo){
		return partitaRepository.findAllByTorneoWithRelazioni(torneo);
	}

	/*
	 * Registrazione del risultato: operazione di aggiornamento.
	 * READ_COMMITTED (default di PostgreSQL) è sufficiente: si aggiorna una singola
	 * riga letta per id, quindi non servono livelli più restrittivi (REPEATABLE_READ
	 * o SERIALIZABLE) che ridurrebbero la concorrenza senza benefici.
	 * L'entità caricata è managed: le modifiche vengono scritte al commit.
	 */
	@Transactional(isolation = Isolation.READ_COMMITTED)
	public Partita registraRisultato(Long partitaId, Integer goalsHome, Integer goalsAway) {
		Partita partita = partitaRepository.findById(partitaId).orElse(null);
		if (partita == null)
			return null;
		partita.setGoalsHome(goalsHome);
		partita.setGoalsAway(goalsAway);
		partita.setStato(StatoPartita.PLAYED);
		return partita;
	}
}
