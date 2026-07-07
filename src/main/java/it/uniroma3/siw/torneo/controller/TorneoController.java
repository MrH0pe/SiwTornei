package it.uniroma3.siw.torneo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import it.uniroma3.siw.torneo.model.Partita;
import it.uniroma3.siw.torneo.model.Torneo;
import it.uniroma3.siw.torneo.service.PartitaService;
import it.uniroma3.siw.torneo.service.TorneoService;

@Controller
public class TorneoController {
	
	private TorneoService torneoService;
	private PartitaService partitaService;
	
	//Costruttore
	public TorneoController(TorneoService torneoService, PartitaService partitaService) {
		this.torneoService = torneoService;
		this.partitaService = partitaService;
	}
	
	@GetMapping("/tornei")
	public String tuttiTornei(Model model){  //gli passo un Model
		List<Torneo> listaTornei = this.torneoService.getAllTornei();   //prendo tutti i tornei con il metodo del Service
		model.addAttribute("listaTornei",listaTornei); //listaTornei lo mando al Controller
		return "tornei/list";
	} 
	
	
	
	@GetMapping("/tornei/{id}")
	public String dettaglioTorneo(@PathVariable("id") Long id, Model model) {
	    Torneo torneo = this.torneoService.findByIdWithSquadre(id);
	    if (torneo == null) {
	        return "redirect:/tornei";
	    }
	    //JOIN FETCH per evitare il problema N+1 sulle associazioni di ogni partita
	    List<Partita> partite = this.partitaService.findAllByTorneoWithRelazioni(torneo);

	    model.addAttribute("torneo", torneo);
	    model.addAttribute("partite", partite);
	    return "tornei/show";
	}
}
