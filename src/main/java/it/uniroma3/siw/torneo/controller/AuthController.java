package it.uniroma3.siw.torneo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import it.uniroma3.siw.torneo.model.Credentials;
import it.uniroma3.siw.torneo.model.User;
import it.uniroma3.siw.torneo.service.CredentialsService;
import jakarta.validation.Valid;

@Controller
public class AuthController {

    private final CredentialsService credentialsService;

    public AuthController(CredentialsService credentialsService) {
        this.credentialsService = credentialsService;
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String register(Model model) {
        Credentials credentials = new Credentials();
        credentials.setUser(new User());
        model.addAttribute("credentials", credentials);
        return "register";
    }

    @PostMapping("/register")
    public String registraUtente(@Valid @ModelAttribute("credentials") Credentials credentials,
                                  BindingResult bindingResult,
                                  Model model) {

        if (credentialsService.findByEmail(credentials.getUser().getEmail()) != null) {
            bindingResult.rejectValue("user.email", "duplicate.email", "Questa email è già associata a un account.");
        }
        if (credentialsService.findByUsername(credentials.getUsername()) != null) {
            bindingResult.rejectValue("username", "duplicate.username", "Questo username è già in uso. Scegline un altro.");
        }

        if (bindingResult.hasErrors()) {
            return "register";
        }

        credentialsService.save(credentials);
        return "redirect:/login";
    }
}
