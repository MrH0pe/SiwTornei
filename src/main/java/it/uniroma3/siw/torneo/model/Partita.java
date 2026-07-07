package it.uniroma3.siw.torneo.model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"dataOra", "luogo"}))
public class Partita {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@NotNull
	private LocalDateTime dataOra;
	@NotBlank
	private String luogo;

	@Min(0) @Max(10)
	private Integer goalsHome;

	@Min(0) @Max(10)
	private Integer goalsAway;
	@NotNull
	@Enumerated(EnumType.STRING) //Salva "SCHEDULED"/"PLAYED" invece dell'ordinale: robusto se l'enum cambia ordine
	private StatoPartita stato;

	public Partita() { //Costruttore NoArgs
	}

	@ManyToOne
	private Torneo torneo;

	@ManyToOne
	private Squadra squadraCasa;

	@ManyToOne
	private Squadra squadraOspite;

	@ManyToOne
	private Arbitro arbitro;
	
	@OneToMany(mappedBy = "partita")
	private List<Commento> commenti = new ArrayList<>();
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public LocalDateTime getDataOra() {
		return dataOra;
	}

	public void setDataOra(LocalDateTime dataOra) {
		this.dataOra = dataOra;
	}

	public String getLuogo() {
		return luogo;
	}

	public void setLuogo(String luogo) {
		this.luogo = luogo;
	}

	public Integer getGoalsHome() {
		return goalsHome;
	}

	public void setGoalsHome(Integer goalsHome) {
		this.goalsHome = goalsHome;
	}

	public Integer getGoalsAway() {
		return goalsAway;
	}

	public void setGoalsAway(Integer goalsAway) {
		this.goalsAway = goalsAway;
	}

	public StatoPartita getStato() {
		return stato;
	}

	public void setStato(StatoPartita stato) {
		this.stato = stato;
	}

	public Torneo getTorneo() {
		return torneo;
	}

	public void setTorneo(Torneo torneo) {
		this.torneo = torneo;
	}

	public Squadra getSquadraCasa() {
		return squadraCasa;
	}

	public void setSquadraCasa(Squadra squadraCasa) {
		this.squadraCasa = squadraCasa;
	}

	public Squadra getSquadraOspite() {
		return squadraOspite;
	}

	public void setSquadraOspite(Squadra squadraOspite) {
		this.squadraOspite = squadraOspite;
	}

	public Arbitro getArbitro() {
		return arbitro;
	}

	public void setArbitro(Arbitro arbitro) {
		this.arbitro = arbitro;
	}

	@Override
	public int hashCode() {
		return Objects.hash(dataOra, luogo);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Partita other = (Partita) obj;
		return Objects.equals(dataOra, other.dataOra) && Objects.equals(luogo, other.luogo);
	}


}
