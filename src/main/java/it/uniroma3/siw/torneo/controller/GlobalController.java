package it.uniroma3.siw.torneo.controller;

//@ControllerAdvice è una classe "trasversale" — i suoi @ModelAttribute vengono eseguiti prima di ogni richiesta, su tutti i controller.
//Sennò andrebbero messi a mano

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import it.uniroma3.siw.torneo.model.Credentials;

@ControllerAdvice
public class GlobalController {

    @ModelAttribute("userDetails")
    public UserDetails getUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && !(auth instanceof AnonymousAuthenticationToken)) {
            return (UserDetails) auth.getPrincipal();
        }
        return null;
    }

    @ModelAttribute("isAdmin")
    public boolean isAdmin() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && !(auth instanceof AnonymousAuthenticationToken)) {
            return auth.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals(Credentials.ADMIN_ROLE));
        }
        return false;
    }
}