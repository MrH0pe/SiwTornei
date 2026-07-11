package it.uniroma3.siw.torneo.model;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"partita_id", "credentials_id", "dataCreazione"}))  //Chiavi + FK
@Getter @Setter @NoArgsConstructor
@EqualsAndHashCode(of = {"dataCreazione", "partita", "credentials"})
public class Commento {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@NotBlank
	private String testo;

	@NotNull
	private LocalDateTime dataCreazione;

	//Commento collega una partita e le credentials dell'utente che lo ha scritto. Quindi ci sono due FK: partita_id e credentials_id
	@ManyToOne
	private Partita partita;

	@ManyToOne
	private Credentials credentials;

	public Commento(String testo, Partita partita, Credentials credentials) {
	    this.testo = testo;
	    this.partita = partita;
	    this.credentials = credentials;
	    this.dataCreazione = LocalDateTime.now(); // Viene impostata automaticamente alla creazione dell'oggetto
	}

}
