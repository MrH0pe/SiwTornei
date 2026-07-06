package it.uniroma3.siw.torneo.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import it.uniroma3.siw.torneo.model.Squadra;
import it.uniroma3.siw.torneo.model.Torneo;
import it.uniroma3.siw.torneo.service.ClassificaService;
import it.uniroma3.siw.torneo.service.TorneoService;

@Controller
public class ClassificaController {

    private final ClassificaService classificaService;
    private final TorneoService torneoService;

    public ClassificaController(ClassificaService classificaService, TorneoService torneoService) {
        this.classificaService = classificaService;
        this.torneoService = torneoService;
    }

    @GetMapping("/tornei/{id}/classifica")
    public String classifica(@PathVariable("id") Long id, Model model) {
        Torneo torneo = torneoService.findByIdWithSquadre(id);
        if (torneo == null) return "redirect:/tornei";
        Map<Squadra, Integer> classifica = classificaService.classificaTorneo(torneo);
        model.addAttribute("torneo", torneo);
        model.addAttribute("classifica", classifica);
        return "tornei/classifica";
    }
}