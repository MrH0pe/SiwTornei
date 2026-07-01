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
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"nome", "anno"}))
public class Torneo {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@NotBlank
	private String nome;
	@NotNull
	@Min(2000)
	@Max(2026)
	private Integer anno;

	@NotBlank
	private String descrizione;

	//Costruttore vuoto, richiesto da JPA
	public Torneo() {

	}

	@ManyToMany  //Lato proprietario controlla fisicamente la join table nel database.
	private List<Squadra> squadre = new ArrayList<>(); //Inizializzo la Lista

	@OneToMany(mappedBy = "torneo") //Cosi mostro tutte le partite di un torneo
	private List<Partita> partite = new ArrayList<>();

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

	public Integer getAnno() {
		return anno;
	}

	public void setAnno(Integer anno) {
		this.anno = anno;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public List<Squadra> getSquadre() {
		return squadre;
	}

	public void setSquadre(List<Squadra> squadre) {
		this.squadre = squadre;
	}

	public List<Partita> getPartite() {
		return partite;
	}

	public void setPartite(List<Partita> partite) {
		this.partite = partite;
	}

	@Override
	public int hashCode() {
		return Objects.hash(anno, nome);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Torneo other = (Torneo) obj;
		return Objects.equals(anno, other.anno) && Objects.equals(nome, other.nome);
	}



}
