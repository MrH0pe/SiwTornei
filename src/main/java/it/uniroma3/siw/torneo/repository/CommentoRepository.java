package it.uniroma3.siw.torneo.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import it.uniroma3.siw.torneo.model.Commento;
import it.uniroma3.siw.torneo.model.Credentials;
import it.uniroma3.siw.torneo.model.Partita;

public interface CommentoRepository extends CrudRepository<Commento, Long>{
	List<Commento> findAllByPartita(Partita partita); //Commenti di una partita
	
	List<Commento> findAllByPartitaAndCredentials(Partita partita, Credentials credentials);  //I miei commenti
}
