package it.uniroma3.siw.torneo.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.uniroma3.siw.torneo.model.Partita;
import it.uniroma3.siw.torneo.model.Torneo;
import it.uniroma3.siw.torneo.repository.PartitaRepository;

@Service
public class PartitaService {

	private PartitaRepository partitaRepository;
	
	public PartitaService(PartitaRepository partitaRepository) {
		this.partitaRepository = partitaRepository;
		
	}
	
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
	public List<Partita> findAllByTorneo(Torneo torneo){
		return (List<Partita>) partitaRepository.findAllByTorneo(torneo);
	}
	
	@Transactional(readOnly = true)
	public boolean existsByLuogoAndDataOra(String luogo, LocalDateTime dataOra) {
		return partitaRepository.existsByLuogoAndDataOra(luogo, dataOra);
	}
	
}
