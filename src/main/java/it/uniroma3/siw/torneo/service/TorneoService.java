package it.uniroma3.siw.torneo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.uniroma3.siw.torneo.model.Torneo;
import it.uniroma3.siw.torneo.repository.TorneoRepository;

@Service
public class TorneoService {
	private TorneoRepository torneoRepository;

	public TorneoService(TorneoRepository torneoRepository) {
		this.torneoRepository = torneoRepository;
	}

	@Transactional(readOnly = true)
	public List<Torneo> getAllTornei(){
		return (List<Torneo>) torneoRepository.findAll();
	}

	@Transactional(readOnly = true) 
	public Torneo findById(Long id) {
		return torneoRepository.findById(id).orElse(null);
	}

	@Transactional
	public void save(Torneo torneo) {
		torneoRepository.save(torneo);
	}

	@Transactional
	public void delete(Torneo torneo) {
		torneoRepository.delete(torneo);
	}

	@Transactional(readOnly = true)
	public boolean existsByNomeAndAnno(String nome, Integer anno) {
		return torneoRepository.existsByNomeAndAnno(nome, anno);
	}
	
	@Transactional(readOnly = true)
	public Torneo findByIdWithSquadre(Long id) {
	    return torneoRepository.findByIdWithSquadre(id).orElse(null);
	}
}
