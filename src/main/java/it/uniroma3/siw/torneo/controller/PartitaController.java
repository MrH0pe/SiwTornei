package it.uniroma3.siw.torneo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import it.uniroma3.siw.torneo.exception.ResourceNotFoundException;
import it.uniroma3.siw.torneo.model.Commento;
import it.uniroma3.siw.torneo.model.Partita;
import it.uniroma3.siw.torneo.service.CommentoService;
import it.uniroma3.siw.torneo.service.PartitaService;

@Controller
public class PartitaController {
	
	@Autowired
	private PartitaService partitaService;

	@Autowired
	private CommentoService commentoService;
	
	@GetMapping("/partite/{id}")
	public String infoPartita(@PathVariable("id") Long id, Model model) {
	    Partita singolaPartita = this.partitaService.findById(id);
	    if (singolaPartita == null) {
	        throw new ResourceNotFoundException("La partita con id " + id + " non esiste o è stata eliminata.");
	    }
	    List<Commento> commentiPartita = this.commentoService.findAllByPartita(singolaPartita);
	    model.addAttribute("partita", singolaPartita);
	    model.addAttribute("commentiPartita", commentiPartita);
	    return "partite/show";
	}
}
