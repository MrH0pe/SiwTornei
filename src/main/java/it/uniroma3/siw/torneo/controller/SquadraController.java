package it.uniroma3.siw.torneo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import it.uniroma3.siw.torneo.model.Squadra;
import it.uniroma3.siw.torneo.service.SquadraService;

@Controller
public class SquadraController {
	private SquadraService squadraService;
	
	public SquadraController(SquadraService squadraService) {
		this.squadraService = squadraService;
	}
	
	@GetMapping("/squadre")
	public String tutteSquadre(Model model){  //gli passo un Model
		//this.squadraService.orderByAnno();
		List<Squadra> listaSquadre = this.squadraService.findAll(); //prendo tutti i tornei con il metodo del Service
		model.addAttribute("listaSquadre",listaSquadre); //listaTornei lo mando al Controller
		return "squadre/list";
	} 
	
	
	
	@GetMapping("/squadre/{id}")
	public String dettaglioSquadra(@PathVariable("id") Long id, Model model) {
	    Squadra squadra = this.squadraService.findByIdWithGiocatori(id);
	    if (squadra == null) {
	        return "redirect:/squadre";
	    }
	    model.addAttribute("squadra", squadra);
	    return "squadre/show";
	}
}
