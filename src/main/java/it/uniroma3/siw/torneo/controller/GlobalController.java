package it.uniroma3.siw.torneo.controller;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

//GlobalController gestisce userDetails
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
}