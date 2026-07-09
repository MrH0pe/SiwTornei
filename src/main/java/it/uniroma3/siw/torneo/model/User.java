package it.uniroma3.siw.torneo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "users")   //User è una parola riservata
@Getter @Setter @NoArgsConstructor
@EqualsAndHashCode(of = "email")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@NotBlank
	private String nome;

	@NotBlank
	private String cognome;

	@Email
	@Column(unique = true)
	@NotBlank
	private String email;

	@OneToOne(mappedBy = "user")
	private Credentials credentials;

	//Costruttore necessario per il MainController
	public User(String nome, String cognome, String email) {
		this.nome = nome;
		this.cognome = cognome;
		this.email = email;
	}

}
