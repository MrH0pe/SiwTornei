package it.uniroma3.siw.torneo;

import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import it.uniroma3.siw.torneo.model.Credentials;
import it.uniroma3.siw.torneo.model.User;
import it.uniroma3.siw.torneo.repository.CredentialsRepository;
//creare automaticamente l'utente admin al primo avvio dell'applicazione
@Component
public class DataLoader implements ApplicationRunner {

    private final CredentialsRepository credentialsRepository;
    private final PasswordEncoder passwordEncoder;

    public DataLoader(CredentialsRepository credentialsRepository, PasswordEncoder passwordEncoder) {
        this.credentialsRepository = credentialsRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(ApplicationArguments args) {
        // Crea l'admin solo se non esiste già
        if (credentialsRepository.findByUsername("admin") == null) {
            User user = new User();
            user.setNome("Admin");
            user.setCognome("SiwTorneo");
            user.setEmail("admin@siw.it");

            Credentials creds = new Credentials();
            creds.setUsername("admin");
            creds.setPassword(passwordEncoder.encode("admin"));
            creds.setRole(Credentials.ADMIN_ROLE);
            creds.setUser(user);

            credentialsRepository.save(creds);
            System.out.println(">>> Admin creato: username=admin password=admin");
        }
    }
}
