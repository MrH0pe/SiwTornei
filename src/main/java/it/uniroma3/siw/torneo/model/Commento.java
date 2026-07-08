package it.uniroma3.siw.torneo.model;

import java.time.LocalDateTime;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"partita_id", "credentials_id", "dataCreazione"}))  //Chiavi + FK
public class Commento {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@NotBlank
	private String testo;
	
	@NotNull
	private LocalDateTime dataCreazione;
	
	@ManyToOne
	private Partita partita;
	
	@ManyToOne
	private Credentials credentials;
	
	public Commento() {
	}
	
	public Commento(String testo, Partita partita, Credentials credentials) {
	    this.testo = testo;
	    this.partita = partita;
	    this.credentials = credentials;
	    this.dataCreazione = LocalDateTime.now(); // Viene impostata automaticamente alla creazione dell'oggetto
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTesto() {
		return testo;
	}

	public void setTesto(String testo) {
		this.testo = testo;
	}

	public LocalDateTime getDataCreazione() {
		return dataCreazione;
	}

	public void setDataCreazione(LocalDateTime dataCreazione) {
		this.dataCreazione = dataCreazione;
	}

	public Partita getPartita() {
		return partita;
	}

	public void setPartita(Partita partita) {
		this.partita = partita;
	}

	public Credentials getCredentials() {
		return credentials;
	}

	public void setCredentials(Credentials credentials) {
		this.credentials = credentials;
	}

	@Override
	public int hashCode() {
		return Objects.hash(credentials, dataCreazione, partita);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Commento other = (Commento) obj;
		return Objects.equals(credentials, other.credentials) && Objects.equals(dataCreazione, other.dataCreazione)
				&& Objects.equals(partita, other.partita);
	}
	
	
}
