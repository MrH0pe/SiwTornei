package it.uniroma3.siw.torneo.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import it.uniroma3.siw.torneo.model.Commento;
import it.uniroma3.siw.torneo.service.CommentoService;

@Controller
public class CommentoController {
	
	@Autowired
	private CommentoService commentoService;
	

	
	
	@GetMapping("/commenti/{id}/edit")
	public String cambiaCommenti(@PathVariable("id") Long id, Model model, Principal principal) {
		Commento commento = this.commentoService.findById(id);
		if (commento == null) return "redirect:/tornei"; //Commento inesistente: evita NullPointerException

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
		if (commento == null) return "redirect:/tornei"; //Commento inesistente: evita NullPointerException

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