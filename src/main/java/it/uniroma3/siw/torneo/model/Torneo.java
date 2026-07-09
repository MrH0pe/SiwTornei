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
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"nome", "anno"}))  //Chiavi
@Getter @Setter @NoArgsConstructor
@EqualsAndHashCode(of = {"nome", "anno"})
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

	@ManyToMany  //Lato proprietario controlla fisicamente la join table nel database.
	private List<Squadra> squadre = new ArrayList<>(); //Inizializzo la Lista

	@OneToMany(mappedBy = "torneo") //Cosi mostro tutte le partite di un torneo
	private List<Partita> partite = new ArrayList<>();

}
