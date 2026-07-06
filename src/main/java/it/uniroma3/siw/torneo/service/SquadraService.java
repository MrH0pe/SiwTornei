package it.uniroma3.siw.torneo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.uniroma3.siw.torneo.model.Squadra;
import it.uniroma3.siw.torneo.repository.SquadraRepository;

@Service
public class SquadraService {
	
	private SquadraRepository squadraRepository;
	
	public SquadraService(SquadraRepository squadraRepository) {
		this.squadraRepository = squadraRepository;
	}
	
	@Transactional(readOnly = true)
	public List<Squadra> findAll(){
		return (List<Squadra>) squadraRepository.findAll();
	}
	@Transactional(readOnly = true)
	public Squadra findById(Long id) {
		return squadraRepository.findById(id).orElse(null);
	}
	
	@Transactional
	public void save(Squadra squadra) {
		squadraRepository.save(squadra);
	}
	
	@Transactional
	public void delete(Squadra squadra) {
		squadraRepository.delete(squadra);
	}
	
	@Transactional(readOnly = true)
	public boolean existsByNomeAndCitta(String nome,String citta) {
		return squadraRepository.existsByNomeAndCitta(nome, citta);
	}
	
	@Transactional(readOnly = true)
	public Squadra findByIdWithGiocatori(Long id) {
	    return squadraRepository.findByIdWithGiocatori(id).orElse(null);
	}
	

}
