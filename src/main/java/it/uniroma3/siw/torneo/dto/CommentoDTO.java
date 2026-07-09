package it.uniroma3.siw.torneo.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;

/*
 * DTO (Data Transfer Object) per i commenti.
 *
 * Problema che risolve: l'entità Commento ha riferimenti a Partita e Credentials,
 * che a loro volta hanno altri riferimenti — se Jackson (il convertitore JSON di Spring)
 * provasse a serializzare direttamente Commento, andrebbe in loop infinito.
 *
 * Soluzione: questo oggetto "piatto" contiene solo i campi che React ha effettivamente
 * bisogno di mostrare (id, testo, username, data), senza relazioni annidate.
 * È il JSON che il browser riceve quando fa fetch('/api/partite/{id}/commenti').
 */
@Getter @AllArgsConstructor
public class CommentoDTO {

    private Long id;
    private String testo;
    private String username;       // estratto da Credentials, non l'oggetto intero
    private LocalDateTime dataCreazione;

}
