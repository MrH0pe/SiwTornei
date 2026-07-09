package it.uniroma3.siw.torneo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.uniroma3.siw.torneo.model.Arbitro;
import it.uniroma3.siw.torneo.repository.ArbitroRepository;

@Service
public class ArbitroService {
	
	@Autowired
	private ArbitroRepository arbitroRepository;
	
	@Transactional(readOnly = true)
	public List<Arbitro> findAll(){
		return (List<Arbitro>) arbitroRepository.findAll();
	}
	@Transactional(readOnly = true)
	public Arbitro findById(Long id) {
		return arbitroRepository.findById(id).orElse(null);
	}
	
	@Transactional
	public void save(Arbitro arbitro) {
		arbitroRepository.save(arbitro);
	}
	
	@Transactional
	public void delete(Arbitro arbitro) {
		arbitroRepository.delete(arbitro);
	}
	
	@Transactional(readOnly = true)
	public boolean existsByCodiceArbitrale(String codice) {
		return arbitroRepository.existsByCodiceArbitrale(codice);
	}
}
