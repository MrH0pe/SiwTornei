package it.uniroma3.siw.torneo.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter @Setter @NoArgsConstructor
@EqualsAndHashCode(of = "username")
public class Credentials {

	public static final String DEFAULT_ROLE = "ROLE_DEFAULT";
	public static final String ADMIN_ROLE = "ROLE_ADMIN";

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@NotBlank
	@Column(unique = true)
	private String username;

	@NotBlank
	private String password;

	private String role;

	@Valid   //Propaga la validazione ai campi di User (nome, cognome, email) nel form di registrazione
	@OneToOne(cascade = CascadeType.ALL)   //Lato proprietario, ha la FK user_id
	private User user;

	//Costruttore necessario per MainController
	public Credentials(String username, String password, User user) {
		this.username = username;
		this.password = password;
		this.user = user;
	}

}
