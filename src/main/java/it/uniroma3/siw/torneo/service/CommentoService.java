package it.uniroma3.siw.torneo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.uniroma3.siw.torneo.model.Commento;
import it.uniroma3.siw.torneo.model.Credentials;
import it.uniroma3.siw.torneo.model.Partita;
import it.uniroma3.siw.torneo.repository.CommentoRepository;

@Service
public class CommentoService {

	@Autowired
	private CommentoRepository commentoRepository;
	
	@Transactional(readOnly = true)
	public List<Commento> findAll(){
		return (List<Commento>) commentoRepository.findAll();
	}
	@Transactional(readOnly = true)
	public Commento findById(Long id) {
		return commentoRepository.findById(id).orElse(null);
	}
	
	@Transactional
	public void save(Commento commento) {
		commentoRepository.save(commento);
	}
	
	@Transactional
	public void delete(Commento commento) {
		commentoRepository.delete(commento);
	}
	
	@Transactional(readOnly = true)
	public List<Commento> findAllByPartita(Partita partita){
		return (List<Commento>) commentoRepository.findAllByPartita(partita);
	}
	
	@Transactional(readOnly = true)
	public List<Commento> findAllByPartitaAndCredentials(Partita partita, Credentials credentials){
		return (List<Commento>) commentoRepository.findAllByPartitaAndCredentials(partita, credentials);
	}
}
