package it.uniroma3.siw.torneo.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.validation.Valid;

import it.uniroma3.siw.torneo.model.Arbitro;
import it.uniroma3.siw.torneo.model.Giocatore;
import it.uniroma3.siw.torneo.model.Partita;
import it.uniroma3.siw.torneo.model.Squadra;
import it.uniroma3.siw.torneo.model.StatoPartita;
import it.uniroma3.siw.torneo.model.Torneo;
import it.uniroma3.siw.torneo.service.ArbitroService;
import it.uniroma3.siw.torneo.service.GiocatoreService;
import it.uniroma3.siw.torneo.service.PartitaService;
import it.uniroma3.siw.torneo.service.SquadraService;
import it.uniroma3.siw.torneo.service.TorneoService;

/*
I metodi HTTP più comuni sono GET e POST. 
GET: è usato per ottenere il contenuto della risorsa indicata come URI (ad es. una pagina HTML)
POST: di norma, è usato per inviare informazioni al server (ad esempio, i dati raccolti da una form).
 In questo caso l'URI indica quale risorsa dovrà gestire le informazioni inviate, e il body conterrà le informazioni stesse
 */


//Controller per l'ADMIN, ossia la sua interfaccia per poter creare e cancellare qualsiasi tornei, partite ecc.

@Controller
public class AdminController {

	private SquadraService squadraService;
	private TorneoService torneoService;
	private GiocatoreService giocatoreService;
	private ArbitroService arbitroService;
	public PartitaService partitaService;

	public AdminController(SquadraService squadraService, TorneoService torneoService,
			GiocatoreService giocatoreService, ArbitroService arbitroService, PartitaService partitaService) {
		this.squadraService = squadraService;
		this.torneoService = torneoService;
		this.giocatoreService = giocatoreService;
		this.arbitroService = arbitroService;
		this.partitaService = partitaService;
	}

	// ==================== SQUADRE ====================

	@GetMapping("/admin/squadre/new")
	public String creaSquadra(Model model) {
		model.addAttribute("nuovaSquadra", new Squadra());
		return "admin/squadre/new";
	}

	@PostMapping("/admin/squadre/new")
	public String aggiungiSquadra(@Valid @ModelAttribute("nuovaSquadra") Squadra squadra,
	                              BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "admin/squadre/new";
		}
		if (this.squadraService.existsByNomeAndCitta(squadra.getNome(), squadra.getCitta())) {
			model.addAttribute("squadraEsistente", "Questa squadra esiste già!");
			return "admin/squadre/new";
		}
		squadraService.save(squadra);
		return "redirect:/admin/squadre";
	}

	@GetMapping("/admin/squadre")
	public String tutteSquadre(Model model) {
		model.addAttribute("listaSquadre", this.squadraService.findAll());
		return "admin/squadre/list";
	}

	@GetMapping("/admin/squadre/{id}/edit")
	public String editSquadra(@PathVariable("id") Long id, Model model) {
		Squadra squadra = squadraService.findById(id);
		if (squadra == null) return "redirect:/admin/squadre";
		model.addAttribute("squadra", squadra);
		return "admin/squadre/edit";
	}

	@PostMapping("/admin/squadre/{id}/edit")
	public String salvaSquadra(@PathVariable("id") Long id,
	                           @Valid @ModelAttribute("squadra") Squadra form,
	                           BindingResult bindingResult, Model model) {
		Squadra existing = squadraService.findById(id);
		if (existing == null) return "redirect:/admin/squadre";
		if (bindingResult.hasErrors()) {
			form.setId(id);
			return "admin/squadre/edit";
		}
		boolean nomeChanged = !existing.getNome().equals(form.getNome());
		boolean cittaChanged = !existing.getCitta().equals(form.getCitta());
		if ((nomeChanged || cittaChanged) && squadraService.existsByNomeAndCitta(form.getNome(), form.getCitta())) {
			model.addAttribute("squadraEsistente", "Questa squadra esiste già!");
			model.addAttribute("squadra", form);
			return "admin/squadre/edit";
		}
		existing.setNome(form.getNome());
		existing.setCitta(form.getCitta());
		existing.setAnnoDiFondazione(form.getAnnoDiFondazione());
		squadraService.save(existing);
		return "redirect:/admin/squadre";
	}

	@PostMapping("/admin/squadre/{id}/delete")
	public String cancellaSquadra(@PathVariable("id") Long id) {
		Squadra squadra = this.squadraService.findById(id);
		if (squadra == null) return "redirect:/admin/squadre";
		squadraService.delete(squadra);
		return "redirect:/admin/squadre";
	}

	// ==================== TORNEI ====================

	@GetMapping("/admin/tornei/new")
	public String creaTorneo(Model model) {
		model.addAttribute("nuovoTorneo", new Torneo());
		return "admin/tornei/new";
	}

	@PostMapping("/admin/tornei/new")
	public String aggiungiTorneo(@Valid @ModelAttribute("nuovoTorneo") Torneo torneo,
	                             BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "admin/tornei/new";
		}
		if (this.torneoService.existsByNomeAndAnno(torneo.getNome(), torneo.getAnno())) {
			model.addAttribute("torneoEsistente", "Questo torneo esiste già!");
			return "admin/tornei/new";
		}
		torneoService.save(torneo);
		return "redirect:/admin/tornei";
	}

	@GetMapping("/admin/tornei")
	public String tuttiTornei(Model model) {
		model.addAttribute("listaTornei", this.torneoService.getAllTornei());
		return "admin/tornei/list";
	}

	@GetMapping("/admin/tornei/{id}/edit")
	public String editTorneo(@PathVariable("id") Long id, Model model) {
		Torneo torneo = torneoService.findById(id);
		if (torneo == null) return "redirect:/admin/tornei";
		model.addAttribute("torneo", torneo);
		return "admin/tornei/edit";
	}

	@PostMapping("/admin/tornei/{id}/edit")
	public String salvaTorneo(@PathVariable("id") Long id,
	                          @Valid @ModelAttribute("torneo") Torneo form,
	                          BindingResult bindingResult, Model model) {
		Torneo existing = torneoService.findById(id);
		if (existing == null) return "redirect:/admin/tornei";
		if (bindingResult.hasErrors()) {
			form.setId(id);
			return "admin/tornei/edit";
		}
		boolean nomeChanged = !existing.getNome().equals(form.getNome());
		boolean annoChanged = !existing.getAnno().equals(form.getAnno());
		if ((nomeChanged || annoChanged) && torneoService.existsByNomeAndAnno(form.getNome(), form.getAnno())) {
			model.addAttribute("torneoEsistente", "Questo torneo esiste già!");
			model.addAttribute("torneo", form);
			return "admin/tornei/edit";
		}
		existing.setNome(form.getNome());
		existing.setAnno(form.getAnno());
		existing.setDescrizione(form.getDescrizione());
		torneoService.save(existing);
		return "redirect:/admin/tornei";
	}

	@PostMapping("/admin/tornei/{id}/delete")
	public String cancellaTornei(@PathVariable("id") Long id) {
		Torneo torneo = this.torneoService.findById(id);
		if (torneo == null) return "redirect:/admin/tornei";
		torneoService.delete(torneo);
		return "redirect:/admin/tornei";
	}

	// ==================== GESTIONE SQUADRE DI UN TORNEO ====================

	@GetMapping("/admin/tornei/{id}/squadre")
	public String gestisciSquadreTorneo(@PathVariable("id") Long id, Model model) {
		Torneo torneo = torneoService.findByIdWithSquadre(id);
		if (torneo == null) return "redirect:/admin/tornei";
		List<Squadra> squadreNelTorneo = torneo.getSquadre();
		List<Squadra> squadreDisponibili = squadraService.findAll().stream()
				.filter(s -> !squadreNelTorneo.contains(s))
				.collect(Collectors.toList());
		model.addAttribute("torneo", torneo);
		model.addAttribute("squadreDisponibili", squadreDisponibili);
		return "admin/tornei/squadre";
	}

	//La logica (coordinamento dei due repository) sta nel service, in un'unica transazione
	@PostMapping("/admin/tornei/{id}/squadre/add")
	public String aggiungiSquadraTorneo(@PathVariable("id") Long id, @RequestParam Long squadraId) {
		if (!torneoService.aggiungiSquadraATorneo(id, squadraId)) return "redirect:/admin/tornei";
		return "redirect:/admin/tornei/" + id + "/squadre";
	}

	@PostMapping("/admin/tornei/{id}/squadre/{squadraId}/remove")
	public String rimuoviSquadraTorneo(@PathVariable("id") Long id, @PathVariable("squadraId") Long squadraId) {
		if (!torneoService.rimuoviSquadraDaTorneo(id, squadraId)) return "redirect:/admin/tornei";
		return "redirect:/admin/tornei/" + id + "/squadre";
	}

	// ==================== GIOCATORI ====================

	@GetMapping("/admin/giocatori/new")
	public String creaGiocatore(Model model) {
		model.addAttribute("listaSquadre", squadraService.findAll());
		model.addAttribute("nuovoGiocatore", new Giocatore());
		return "admin/giocatori/new";
	}

	@PostMapping("/admin/giocatori/new")
	public String aggiungiGiocatore(@RequestParam String nome,
	                                @RequestParam String cognome,
	                                @RequestParam String ruolo,
	                                @RequestParam Integer altezza,
	                                @RequestParam String dataDiNascita,
	                                @RequestParam(required = false) Long squadraId,
	                                Model model) {
		Giocatore g = new Giocatore();
		g.setNome(nome);
		g.setCognome(cognome);
		g.setRuolo(ruolo);
		g.setAltezza(altezza);
		try {
			g.setDataDiNascita(LocalDate.parse(dataDiNascita));
		} catch (DateTimeParseException e) {
			model.addAttribute("erroreForm", "Data di nascita non valida.");
			model.addAttribute("listaSquadre", squadraService.findAll());
			model.addAttribute("nuovoGiocatore", g);
			return "admin/giocatori/new";
		}
		if (squadraId != null) g.setSquadra(squadraService.findById(squadraId));
		giocatoreService.save(g);
		return "redirect:/admin/giocatori";
	}

	@GetMapping("/admin/giocatori")
	public String tuttiGiocatori(Model model) {
		model.addAttribute("listaGiocatori", this.giocatoreService.findAll());
		return "admin/giocatori/list";
	}

	@GetMapping("/admin/giocatori/{id}/edit")
	public String editGiocatore(@PathVariable("id") Long id, Model model) {
		Giocatore giocatore = giocatoreService.findById(id);
		if (giocatore == null) return "redirect:/admin/giocatori";
		model.addAttribute("giocatore", giocatore);
		model.addAttribute("listaSquadre", squadraService.findAll());
		return "admin/giocatori/edit";
	}

	@PostMapping("/admin/giocatori/{id}/edit")
	public String salvaGiocatore(@PathVariable("id") Long id,
	                             @RequestParam String nome,
	                             @RequestParam String cognome,
	                             @RequestParam String ruolo,
	                             @RequestParam Integer altezza,
	                             @RequestParam String dataDiNascita,
	                             @RequestParam(required = false) Long squadraId) {
		Giocatore giocatore = giocatoreService.findById(id);
		if (giocatore == null) return "redirect:/admin/giocatori";
		giocatore.setNome(nome);
		giocatore.setCognome(cognome);
		giocatore.setRuolo(ruolo);
		giocatore.setAltezza(altezza);
		try {
			giocatore.setDataDiNascita(LocalDate.parse(dataDiNascita));
		} catch (DateTimeParseException e) {
			return "redirect:/admin/giocatori/" + id + "/edit";
		}
		giocatore.setSquadra(squadraId != null ? squadraService.findById(squadraId) : null);
		giocatoreService.save(giocatore);
		return "redirect:/admin/giocatori";
	}

	@PostMapping("/admin/giocatori/{id}/delete")
	public String cancellaGiocatore(@PathVariable("id") Long id) {
		Giocatore giocatore = this.giocatoreService.findById(id);
		if (giocatore == null) return "redirect:/admin/giocatori";
		giocatoreService.delete(giocatore);
		return "redirect:/admin/giocatori";
	}

	// ==================== ARBITRI ====================

	@GetMapping("/admin/arbitri")
	public String tuttiArbitri(Model model) {
		model.addAttribute("listaArbitri", arbitroService.findAll());
		return "admin/arbitri/list";
	}

	@GetMapping("/admin/arbitri/new")
	public String creaArbitro(Model model) {
		model.addAttribute("nuovoArbitro", new Arbitro());
		return "admin/arbitri/new";
	}

	@PostMapping("/admin/arbitri/new")
	public String aggiungiArbitro(@Valid @ModelAttribute("nuovoArbitro") Arbitro arbitro,
	                              BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "admin/arbitri/new";
		}
		if (arbitroService.existsByCodiceArbitrale(arbitro.getCodiceArbitrale())) {
			model.addAttribute("arbitroEsistente", "Codice arbitrale già in uso!");
			return "admin/arbitri/new";
		}
		arbitroService.save(arbitro);
		return "redirect:/admin/arbitri";
	}

	@PostMapping("/admin/arbitri/{id}/delete")
	public String cancellaArbitro(@PathVariable("id") Long id) {
		Arbitro arbitro = arbitroService.findById(id);
		if (arbitro == null) return "redirect:/admin/arbitri";
		arbitroService.delete(arbitro);
		return "redirect:/admin/arbitri";
	}

	// ==================== PARTITE ====================

	@GetMapping("/admin/partite/new")
	public String creaPartita(Model model) {
		model.addAttribute("listaTornei", torneoService.getAllTornei());
		model.addAttribute("listaSquadre", squadraService.findAll());
		model.addAttribute("listaArbitri", arbitroService.findAll());
		return "admin/partite/new";
	}

	@GetMapping("/api/tornei/{id}/squadre")
	@ResponseBody
	public List<Map<String, Object>> squadreDelTorneo(@PathVariable Long id) {
	    Torneo torneo = torneoService.findByIdWithSquadre(id);
	    if (torneo == null) return Collections.emptyList();
	    List<Map<String, Object>> result = new ArrayList<>();
	    for (Squadra s : torneo.getSquadre()) {
	        Map<String, Object> map = new HashMap<>();
	        map.put("id", s.getId());
	        map.put("nome", s.getNome());
	        result.add(map);
	    }
	    return result;
	}
	@PostMapping("/admin/partite/new")
	public String aggiungiPartita(@RequestParam String dataOra,
	                              @RequestParam String luogo,
	                              @RequestParam Long torneoId,
	                              @RequestParam Long squadraCasaId,
	                              @RequestParam Long squadraOspiteId,
	                              @RequestParam Long arbitroId,
	                              @RequestParam StatoPartita stato,
	                              Model model) {
		Partita p = new Partita();
		try {
			p.setDataOra(LocalDateTime.parse(dataOra));
		} catch (DateTimeParseException e) {
			return erroreFormPartita(model, "Data e ora non valide.");
		}
		if (squadraCasaId.equals(squadraOspiteId)) {
			return erroreFormPartita(model, "La squadra di casa e quella ospite devono essere diverse.");
		}
		if (partitaService.existsByLuogoAndDataOra(luogo, p.getDataOra())) {
			return erroreFormPartita(model, "Esiste già una partita in quel luogo a quell'orario.");
		}
		p.setLuogo(luogo);
		p.setTorneo(torneoService.findById(torneoId));
		p.setSquadraCasa(squadraService.findById(squadraCasaId));
		p.setSquadraOspite(squadraService.findById(squadraOspiteId));
		p.setArbitro(arbitroService.findById(arbitroId));
		p.setStato(stato);
		partitaService.save(p);
		return "redirect:/admin/partite";
	}

	//Ripopola il form di creazione partita mostrando un messaggio di errore
	private String erroreFormPartita(Model model, String messaggio) {
		model.addAttribute("erroreForm", messaggio);
		model.addAttribute("listaTornei", torneoService.getAllTornei());
		model.addAttribute("listaSquadre", squadraService.findAll());
		model.addAttribute("listaArbitri", arbitroService.findAll());
		return "admin/partite/new";
	}

	@GetMapping("/admin/partite")
	public String tuttePartite(Model model) {
		//JOIN FETCH: una sola query invece del problema N+1 (una query extra per ogni associazione EAGER)
		model.addAttribute("listaPartite", this.partitaService.findAllWithRelazioni());
		return "admin/partite/list";
	}

	@GetMapping("/admin/partite/{id}/edit")
	public String editPartita(@PathVariable("id") Long id, Model model) {
		Partita partita = partitaService.findById(id);
		if (partita == null) return "redirect:/admin/partite";
		model.addAttribute("partita", partita);
		model.addAttribute("listaTornei", torneoService.getAllTornei());
		model.addAttribute("listaSquadre", squadraService.findAll());
		model.addAttribute("listaArbitri", arbitroService.findAll());
		return "admin/partite/edit";
	}

	@PostMapping("/admin/partite/{id}/edit")
	public String salvaPartita(@PathVariable("id") Long id,
	                           @RequestParam String dataOra,
	                           @RequestParam String luogo,
	                           @RequestParam Long torneoId,
	                           @RequestParam Long squadraCasaId,
	                           @RequestParam Long squadraOspiteId,
	                           @RequestParam Long arbitroId,
	                           @RequestParam StatoPartita stato) {
		Partita partita = partitaService.findById(id);
		if (partita == null) return "redirect:/admin/partite";
		try {
			partita.setDataOra(LocalDateTime.parse(dataOra));
		} catch (DateTimeParseException e) {
			return "redirect:/admin/partite/" + id + "/edit";
		}
		partita.setLuogo(luogo);
		partita.setTorneo(torneoService.findById(torneoId));
		partita.setSquadraCasa(squadraService.findById(squadraCasaId));
		partita.setSquadraOspite(squadraService.findById(squadraOspiteId));
		partita.setArbitro(arbitroService.findById(arbitroId));
		partita.setStato(stato);
		partitaService.save(partita);
		return "redirect:/admin/partite";
	}

	@PostMapping("/admin/partite/{id}/delete")
	public String cancellaPartita(@PathVariable("id") Long id) {
		Partita partita = this.partitaService.findById(id);
		if (partita == null) return "redirect:/admin/partite";
		partitaService.delete(partita);
		return "redirect:/admin/partite";
	}

	// ==================== RISULTATO ====================

	@GetMapping("/admin/partite/{id}/risultato")
	public String risultatoPartita(@PathVariable("id") Long id, Model model) {
		Partita partita = this.partitaService.findById(id);
		if (partita == null) return "redirect:/admin/partite";
		model.addAttribute("partita", partita);
		return "admin/partite/risultato";
	}

	@PostMapping("/admin/partite/{id}/risultato")
	public String salvaRisultato(@PathVariable("id") Long id,
	                             @RequestParam Integer goalsHome,
	                             @RequestParam Integer goalsAway,
	                             Model model) {
		//Validazione lato server (il min/max del form HTML è aggirabile)
		if (goalsHome == null || goalsAway == null || goalsHome < 0 || goalsHome > 10 || goalsAway < 0 || goalsAway > 10) {
			Partita partita = this.partitaService.findById(id);
			if (partita == null) return "redirect:/admin/partite";
			model.addAttribute("erroreForm", "I goal devono essere compresi tra 0 e 10.");
			model.addAttribute("partita", partita);
			return "admin/partite/risultato";
		}
		//La logica di aggiornamento sta nel service, in una transazione READ_COMMITTED
		this.partitaService.registraRisultato(id, goalsHome, goalsAway);
		return "redirect:/admin/partite";
	}
}
