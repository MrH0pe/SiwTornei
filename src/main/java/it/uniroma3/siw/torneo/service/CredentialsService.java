package it.uniroma3.siw.torneo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.uniroma3.siw.torneo.model.Credentials;
import it.uniroma3.siw.torneo.repository.CredentialsRepository;

@Service
public class CredentialsService {
	
	@Autowired
	private CredentialsRepository credentialsRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Transactional
	public void save(Credentials credentials) {
		String pwdCifrata = passwordEncoder.encode(credentials.getPassword());
		
		credentials.setPassword(pwdCifrata);
		credentials.setRole(Credentials.DEFAULT_ROLE);
		credentialsRepository.save(credentials);
	}
	
	@Transactional(readOnly = true)
	public Credentials findByUsername(String username) {
		return credentialsRepository.findByUsername(username);
	}
	
	public Credentials findByEmail(String email) {
	    return this.credentialsRepository.findByUserEmail(email);
	}
}
