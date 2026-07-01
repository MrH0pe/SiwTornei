package it.uniroma3.siw.torneo.controller;

import java.security.Principal;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import it.uniroma3.siw.torneo.model.Commento;
import it.uniroma3.siw.torneo.model.Credentials;
import it.uniroma3.siw.torneo.model.Partita;
import it.uniroma3.siw.torneo.service.CommentoService;
import it.uniroma3.siw.torneo.service.CredentialsService;
import it.uniroma3.siw.torneo.service.PartitaService;

@Controller
public class CommentoController {
	
	private CommentoService commentoService;
	private PartitaService partitaService;
	private CredentialsService credentialsService;
	
	public CommentoController(CommentoService commentoService , PartitaService partitaService, CredentialsService credentialsService) {
		this.commentoService = commentoService;
		this.partitaService = partitaService;
		this.credentialsService = credentialsService;
	}
	
	@PostMapping("/partite/{id}/commenti")
	public String aggiungiCommento(@PathVariable("id") Long id, 
			@RequestParam(value = "testo", required = false) String testo, 
			Model model) {
		
		// 1. Controllo di validità dell'input (Difesa lato server)
		if (testo == null || testo.trim().isEmpty()) {
			return "redirect:/partite/" + id;
		}
		
		// 2. Carica la partita
		Partita partita = this.partitaService.findById(id);
		
		// 3. Prendi l'utente loggato
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		
		// 4. Carica le Credentials
		Credentials credenziali = credentialsService.findByUsername(username);
		
		// 5. Crea un nuovo oggetto Commento sfruttando il nuovo costruttore
		Commento commento = new Commento(testo, partita, credenziali);
		
		// 6. Salva il commento
		this.commentoService.save(commento);
		
		// 7. Ritorna il redirect alla pagina della partita
		return "redirect:/partite/" + id;
	}
	
	
	@GetMapping("/commenti/{id}/edit")
	public String cambiaCommenti(@PathVariable("id") Long id, Model model, Principal principal) {
		Commento commento = this.commentoService.findById(id);
		
		// Controllo sicurezza
		if (principal == null || !principal.getName().equals(commento.getCredentials().getUsername())) {
			return "redirect:/partite/" + commento.getPartita().getId();
		}
		
		model.addAttribute("commento", commento);
		return "commenti/edit"; 
	}
	
	@PostMapping("/commenti/{id}/edit")
	public String salvaCommentiCambiati(@PathVariable("id") Long id, 
			@RequestParam(value = "testo", required = false) String testo, 
			Principal principal) {
		
		Commento commento = this.commentoService.findById(id);
		
		// Controllo sicurezza
		if (principal == null || !principal.getName().equals(commento.getCredentials().getUsername())) {
			return "redirect:/partite/" + commento.getPartita().getId();
		}
		
		// Controllo di validità dell'input
		if (testo == null || testo.trim().isEmpty()) {
			return "redirect:/commenti/" + id + "/edit";
		}
		
		commento.setTesto(testo);
		this.commentoService.save(commento);
		
		return "redirect:/partite/" + commento.getPartita().getId();
	}
}