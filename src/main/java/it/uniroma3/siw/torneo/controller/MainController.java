package it.uniroma3.siw.torneo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import it.uniroma3.siw.torneo.model.Credentials;
import it.uniroma3.siw.torneo.model.User;
import it.uniroma3.siw.torneo.service.CredentialsService;

@Controller
public class MainController {
	
	private final CredentialsService credentialsService;

	MainController(CredentialsService credentialsService) {
		this.credentialsService = credentialsService;
	}


	@GetMapping("/")
	public String home() {
		return "index";
	}
	
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/register")
	public String register() {
		return "register";
	}
	
	@PostMapping("/register")
	public String registraUtente(@RequestParam String nome,
	                             @RequestParam String cognome,
	                             @RequestParam String email,
	                             @RequestParam String username,
	                             @RequestParam String password, 
	                             Model model) {
	    
	    // 1. PRIMO CONTROLLO: Esiste l'email?
	    if (this.credentialsService.findByEmail(email) != null) {
	        model.addAttribute("erroreEmail", "Questa email è già associata a un account.");
	        model.addAttribute("nomeInserito", nome);
	        model.addAttribute("cognomeInserito", cognome);
	        model.addAttribute("usernameInserito", username); 
	        return "register"; // Blocca tutto e ricarica il form
	    }

	    // 2. SECONDO CONTROLLO: Esiste lo username?
	    if (this.credentialsService.findByUsername(username) != null) {
	        model.addAttribute("erroreUsername", "Questo username è già in uso. Scegline un altro.");
	        model.addAttribute("nomeInserito", nome);
	        model.addAttribute("cognomeInserito", cognome);
	        model.addAttribute("emailInserita", email);
	        return "register"; // Blocca tutto e ricarica il form
	    }

	    // 3. SALVATAGGIO: Solo se i due controlli sopra sono passati!
	    User user = new User(nome, cognome, email);
	    Credentials credentials = new Credentials(username, password, user);
	    credentialsService.save(credentials);
	    
	    // 4. REDIRECT al login
	    return "redirect:/login";
	}
	
}
