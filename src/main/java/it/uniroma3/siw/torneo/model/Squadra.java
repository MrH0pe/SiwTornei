package it.uniroma3.siw.torneo.model;

import java.util.ArrayList;
import java.util.List;

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
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"nome", "citta"}))
@Getter @Setter @NoArgsConstructor
@EqualsAndHashCode(of = {"nome", "citta"})
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

	@ManyToMany(mappedBy = "squadre")   //Lato inverso, "squadre" che è il nome del campo in Torneo!
	private List<Torneo> tornei = new ArrayList<>();   //Inizializzo la Lista

	@OneToMany(mappedBy = "squadra")
	private List<Giocatore> giocatori = new ArrayList<>();

}
