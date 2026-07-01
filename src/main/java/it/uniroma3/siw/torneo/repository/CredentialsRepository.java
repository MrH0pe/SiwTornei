package it.uniroma3.siw.torneo.repository;

import org.springframework.data.repository.CrudRepository;

import it.uniroma3.siw.torneo.model.Credentials;

//Non ho bisogno di UserRepository, ci arrivo tramite CredentialsRepository
public interface CredentialsRepository extends CrudRepository<Credentials, Long>{
	Credentials findByUsername(String username);
	
	Credentials findByUserEmail(String email);
}
