package it.uniroma3.siw.torneo.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"nome", "citta"}))
public class Squadra {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@NotBlank
	private String nome;
	@NotNull
	private Integer annoDiFondazione;
	@NotBlank
	private String citta;

	//Costruttore NoArgs richiesto da JPA
	public Squadra() {

	}

	@ManyToMany(mappedBy = "squadre")   //Lato inverso, "squadre" che è il nome del campo in Torneo!
	private List<Torneo> tornei = new ArrayList<>();   //Inizializzo la Lista

	@OneToMany(mappedBy = "squadra")
	private List<Giocatore> giocatori = new ArrayList<>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Integer getAnnoDiFondazione() {
		return annoDiFondazione;
	}

	public void setAnnoDiFondazione(Integer annoDiFondazione) {
		this.annoDiFondazione = annoDiFondazione;
	}

	public String getCitta() {
		return citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}



	public List<Torneo> getTornei() {
		return tornei;
	}

	public void setTornei(List<Torneo> tornei) {
		this.tornei = tornei;
	}



	public List<Giocatore> getGiocatori() {
		return giocatori;
	}

	public void setGiocatori(List<Giocatore> giocatori) {
		this.giocatori = giocatori;
	}

	@Override
	public int hashCode() {
		return Objects.hash(citta, nome);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Squadra other = (Squadra) obj;
		return Objects.equals(citta, other.citta) && Objects.equals(nome, other.nome);
	}


}
