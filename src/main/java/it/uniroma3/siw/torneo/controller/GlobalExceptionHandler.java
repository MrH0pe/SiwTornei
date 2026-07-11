package it.uniroma3.siw.torneo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.servlet.resource.NoResourceFoundException;

import it.uniroma3.siw.torneo.exception.ResourceNotFoundException;
import jakarta.servlet.http.HttpServletRequest;

/*
 * Gestore GLOBALE delle eccezioni (@ControllerAdvice, come il GlobalController):
 * intercetta le eccezioni lanciate da QUALSIASI controller e decide quale
 * pagina d'errore mostrare e con quale codice HTTP.
 *
 * Due livelli di gestione degli errori in questa applicazione:
 * 1) Questo handler   -> eccezioni lanciate DENTRO i controller (es. ResourceNotFoundException)
 * 2) Spring Boot      -> errori "di container" (URL inesistente, 403, ecc.) finiscono su /error
 *                        e Spring Boot cerca automaticamente i template error/404.html,
 *                        error/403.html, error/500.html in base al codice di stato.
 * Entrambi i livelli usano gli stessi template in templates/error/.
 */
@ControllerAdvice
public class GlobalExceptionHandler {

    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    /*
     * 404 "di dominio": il controller ha cercato un'entità nel DB e non l'ha trovata.
     * Il messaggio personalizzato (es. "Il torneo con id 42 non esiste")
     * viene messo nel Model e mostrato nella pagina 404.
     */
    @ExceptionHandler(ResourceNotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String gestisciRisorsaNonTrovata(ResourceNotFoundException e,
                                            HttpServletRequest request, Model model) {
        model.addAttribute("messaggio", e.getMessage());
        model.addAttribute("path", request.getRequestURI());
        return "error/404";
    }

    /*
     * 404 "tecnico": l'URL richiesto non corrisponde a nessun @GetMapping/@PostMapping
     * né a una risorsa statica (css, js, ...). Senza questo handler finirebbe
     * nel catch-all qui sotto e verrebbe mostrato erroneamente un 500.
     */
    @ExceptionHandler(NoResourceFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String gestisciUrlInesistente(NoResourceFoundException e,
                                         HttpServletRequest request, Model model) {
        model.addAttribute("path", "/" + e.getResourcePath());
        return "error/404";
    }

    /*
     * 404 per URL malformati: es. /tornei/abc dove "abc" non è convertibile in Long.
     * Senza questo handler l'eccezione di conversione finirebbe nel catch-all (500),
     * ma per l'utente un URL del genere equivale a una pagina inesistente.
     */
    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String gestisciUrlMalformato(MethodArgumentTypeMismatchException e,
                                        HttpServletRequest request, Model model) {
        model.addAttribute("messaggio", "L'indirizzo richiesto non è valido.");
        model.addAttribute("path", request.getRequestURI());
        return "error/404";
    }

    /*
     * Catch-all: qualsiasi altra eccezione non prevista -> errore 500.
     * L'eccezione viene loggata (con stack trace) per il debug,
     * ma all'utente mostriamo solo una pagina di cortesia senza dettagli tecnici.
     */
    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public String gestisciErroreGenerico(Exception e,
                                         HttpServletRequest request, Model model) throws Exception {
        // le eccezioni di autorizzazione vanno rilanciate: le gestisce Spring Security (403)
        if (e instanceof AccessDeniedException) {
            throw e;
        }
        logger.error("Errore interno su {} {}", request.getMethod(), request.getRequestURI(), e);
        model.addAttribute("path", request.getRequestURI());
        return "error/500";
    }
}
