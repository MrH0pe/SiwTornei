package it.uniroma3.siw.torneo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.uniroma3.siw.torneo.model.Giocatore;
import it.uniroma3.siw.torneo.repository.GiocatoreRepository;

@Service
public class GiocatoreService {
	private GiocatoreRepository giocatoreRepository;
	
	public GiocatoreService(GiocatoreRepository giocatoreRepository) {
		this.giocatoreRepository = giocatoreRepository;
	}
	
	@Transactional(readOnly = true)
	public List<Giocatore> findAll(){
		return (List<Giocatore>) giocatoreRepository.findAll();
	}
	@Transactional(readOnly = true)
	public Giocatore findById(Long id) {
		return giocatoreRepository.findById(id).orElse(null);
	}
	
	@Transactional
	public void save(Giocatore giocatore) {
		giocatoreRepository.save(giocatore);
	}
	
	@Transactional
	public void delete(Giocatore giocatore) {
		giocatoreRepository.delete(giocatore);
	}
}
