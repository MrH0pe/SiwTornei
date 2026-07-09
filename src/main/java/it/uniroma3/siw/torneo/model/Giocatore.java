package it.uniroma3.siw.torneo.model;

import java.time.LocalDate;

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
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"nome", "cognome", "data_di_nascita"}))  //Chiavi
@Getter @Setter @NoArgsConstructor   //NoArgsConstructor richiesto da JPA
@EqualsAndHashCode(of = {"nome", "cognome", "dataDiNascita"})
public class Giocatore {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@NotBlank
	private String nome;
	@NotBlank
	private String cognome;
	@NotNull
	private LocalDate  dataDiNascita;
	@NotBlank
	private String ruolo;
	@NotNull
	private Integer altezza;

	@ManyToOne
	private Squadra squadra;

}
