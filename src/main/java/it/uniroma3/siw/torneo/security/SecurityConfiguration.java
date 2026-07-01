package it.uniroma3.siw.torneo.security;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import it.uniroma3.siw.torneo.model.Credentials;


/*
GET /              → permitAll()       ← tutti, anche anonimi
GET /login         → permitAll()       ← serve per mostrare il form!
POST /login        → permitAll()       ← serve per inviare le credenziali!
GET /admin/**      → solo ADMIN        ← percorso protetto
POST /admin/**     → solo ADMIN
qualsiasi altro    → authenticated()   ← qualsiasi utente loggato
*/


@Configuration
@EnableWebSecurity
public class SecurityConfiguration {
	
    private final DataSource dataSource;
    
    public SecurityConfiguration(DataSource dataSource) {
        this.dataSource = dataSource;
    }
    // Dove sono le credenziali nel DB e come leggerle
    @Bean
    public UserDetailsService userDetailsService() {
        JdbcUserDetailsManager manager = new JdbcUserDetailsManager(dataSource);
        // Query per recuperare username e password dall'Entity Credentials
        manager.setUsersByUsernameQuery(
            "SELECT username, password, 1 as enabled FROM credentials WHERE username=?");
        // Query per recuperare il ruolo
        manager.setAuthoritiesByUsernameQuery(
            "SELECT username, role FROM credentials WHERE username=?");
        return manager;
    }
    // Come cifrare le password (BCrypt)
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    // Regole di accesso, form di login, logout
    @Bean
    protected SecurityFilterChain configure(HttpSecurity httpSecurity) throws Exception {
        // Blocco 1: chi può accedere a cosa
        httpSecurity.authorizeHttpRequests(authorize -> {     
        	authorize.requestMatchers(HttpMethod.GET,
        		    "/", "/index", "/login", "/register", "/error",
        		    "/tornei/**", "/squadre/**", "/partite/**",
        		    "/css/**", "/images/**", "/favicon.ico").permitAll();
        	authorize.requestMatchers(HttpMethod.POST, "/partite/*/commenti")
            .hasAnyAuthority(Credentials.DEFAULT_ROLE, Credentials.ADMIN_ROLE);
            authorize.requestMatchers(HttpMethod.POST,
                "/register", "/login").permitAll();
            authorize.requestMatchers(HttpMethod.GET, "/admin/**")
                .hasAnyAuthority(Credentials.ADMIN_ROLE);
            authorize.requestMatchers(HttpMethod.POST, "/admin/**")
                .hasAnyAuthority(Credentials.ADMIN_ROLE);
            authorize.anyRequest().authenticated();
        });
        // Blocco 2: form di login
        httpSecurity.formLogin(form -> {
            form.loginPage("/login").permitAll();
            form.defaultSuccessUrl("/", true);
            form.failureUrl("/login?error=true");
        });
        // Blocco 3: logout
        httpSecurity.logout(logout -> {
            logout.logoutUrl("/logout");
            logout.logoutSuccessUrl("/");
            logout.invalidateHttpSession(true);
            logout.deleteCookies("JSESSIONID");
            logout.clearAuthentication(true);
            logout.permitAll();
        });
        return httpSecurity.build();
    }
}
