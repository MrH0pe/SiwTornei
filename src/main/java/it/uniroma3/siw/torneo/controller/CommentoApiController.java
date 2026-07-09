package it.uniroma3.siw.torneo.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import it.uniroma3.siw.torneo.dto.CommentoDTO;
import it.uniroma3.siw.torneo.model.Commento;
import it.uniroma3.siw.torneo.model.Credentials;
import it.uniroma3.siw.torneo.model.Partita;
import it.uniroma3.siw.torneo.service.CommentoService;
import it.uniroma3.siw.torneo.service.CredentialsService;
import it.uniroma3.siw.torneo.service.PartitaService;

/*
 * REST controller per i commenti: espone le API JSON che il componente React chiama.
 *
 * Differenza con CommentoController (Thymeleaf):
 *   - @Controller restituisce il nome di una pagina HTML da renderizzare
 *   - @RestController restituisce direttamente dati JSON che il browser legge via fetch()
 *
 * Tutti gli endpoint vivono sotto /api/ così la SecurityConfiguration li gestisce separatamente
 * dagli endpoint Thymeleaf normali.
 */
@RestController
@RequestMapping("/api")
public class CommentoApiController {

    @Autowired
    private CommentoService commentoService;

    @Autowired
    private PartitaService partitaService;

    @Autowired
    private CredentialsService credentialsService;

    /*
     * GET /api/partite/{id}/commenti
     * Chiamato da React al montaggio del componente per caricare la lista commenti.
     * Restituisce un array JSON di CommentoDTO, accessibile anche agli utenti non loggati.
     */
    @GetMapping("/partite/{id}/commenti")
    public List<CommentoDTO> getCommenti(@PathVariable Long id) {
        Partita partita = partitaService.findById(id);
        if (partita == null) return List.of();
        return commentoService.findAllByPartita(partita).stream()
                .map(c -> new CommentoDTO(
                        c.getId(),
                        c.getTesto(),
                        c.getCredentials().getUsername(),
                        c.getDataCreazione()))
                .collect(Collectors.toList());
    }

    /*
     * POST /api/partite/{id}/commenti
     * Chiamato da React quando l'utente invia il form "Lascia un commento".
     * Il body arriva come JSON: { "testo": "..." }
     * Principal è l'utente loggato (Spring lo inietta automaticamente dalla sessione).
     * Restituisce il commento appena salvato come JSON, oppure un codice di errore.
     */
    @PostMapping("/partite/{id}/commenti")
    public ResponseEntity<CommentoDTO> addCommento(@PathVariable Long id,
                                                    @RequestBody Map<String, String> body,
                                                    Principal principal) {
        if (principal == null) return ResponseEntity.status(401).build();

        String testo = body.get("testo");
        if (testo == null || testo.trim().isEmpty()) return ResponseEntity.badRequest().build();

        Credentials credenziali = credentialsService.findByUsername(principal.getName());
        if (credenziali == null) return ResponseEntity.status(401).build();
        // gli admin non possono postare commenti (stessa regola del controller Thymeleaf)
        if (Credentials.ADMIN_ROLE.equals(credenziali.getRole())) return ResponseEntity.status(403).build();

        Partita partita = partitaService.findById(id);
        if (partita == null) return ResponseEntity.notFound().build();

        Commento commento = new Commento(testo.trim(), partita, credenziali);
        commentoService.save(commento);

        return ResponseEntity.ok(new CommentoDTO(
                commento.getId(),
                commento.getTesto(),
                commento.getCredentials().getUsername(),
                commento.getDataCreazione()));
    }

    /*
     * DELETE /api/commenti/{id}
     * Chiamato da React quando l'utente clicca "Elimina" su un commento.
     * Può eliminare solo l'autore del commento oppure un admin.
     * Restituisce 204 No Content se va a buon fine, altrimenti un codice di errore.
     */
    @DeleteMapping("/commenti/{id}")
    public ResponseEntity<Void> deleteCommento(@PathVariable Long id, Principal principal) {
        if (principal == null) return ResponseEntity.status(401).build();

        Commento commento = commentoService.findById(id);
        if (commento == null) return ResponseEntity.notFound().build();

        Credentials credenziali = credentialsService.findByUsername(principal.getName());
        if (credenziali == null) return ResponseEntity.status(401).build();

        boolean isAdmin = Credentials.ADMIN_ROLE.equals(credenziali.getRole());
        boolean isAutore = principal.getName().equals(commento.getCredentials().getUsername());

        if (!isAdmin && !isAutore) return ResponseEntity.status(403).build();

        commentoService.delete(commento);
        return ResponseEntity.noContent().build();
    }
}
