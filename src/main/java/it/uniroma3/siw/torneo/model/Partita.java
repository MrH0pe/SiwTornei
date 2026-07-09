package it.uniroma3.siw.torneo.model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

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
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"dataOra", "luogo"}))  //Chiavi
@Getter @Setter @NoArgsConstructor
@EqualsAndHashCode(of = {"dataOra", "luogo"})
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
	@Enumerated(EnumType.STRING) //Salva "SCHEDULED"/"PLAYED"
	private StatoPartita stato;

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

}
