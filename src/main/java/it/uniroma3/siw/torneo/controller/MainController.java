package it.uniroma3.siw.torneo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/*
 * ---PATTERN MVC---
 * MODEL -> Entità -> ORM Mapping tra Java e SQL (Classe = Tabella , Oggetto = riga tabella) -> JPA è il suo standard (Hibernate)-> Tabelle del DB -> Movie
 * 
 * REPOSITORY (Collezione persistente) -> CRUD + Funzioni di utilità -> Accesso dati DB -> Una classe per ogni Model -> MovieRepository
 * 
 * SERVICE -> Metodi operazioni offerte dal sistema -> Invoca metodi del Repository -> Sfrutta il Repository! -> MovieService 
 * 
 * CONTROLLER -> Gestione richieste HTTP (GET o POST) + URL -> Un metodo per ogni richiesta HTTP: gestisce i dati che arrivano, prepara e mette nella vista i dati 
 * tramite addAttribute(String, Object), ritorna una stringa come risposta ossia la pagina di ritorno.
 * Il controller sfrutta il Service! -> MovieController
 * 
 * VIEW -> Thymeleaf (tecnologia di templating) -> Espressioni e istruzioni di controllo sono espressi tramite attributi HTML 
 * th:text , th:if, th:unless , th:each, th:href, 	
 * ${...} Contengono variabili   ,   @{...} Contengono Link
 * 
 * HTML form -> <form action="path della risorsa" method="POST"> -> 
 * Grazie a Thymeleaf -> <form th:action="@{/movies}" method="POST" th:object="${movie}">
						    <div>
						        Titolo: <span><input required type="text" th:field="${movie.title}"/></span>
						      </div>

 * NB: th:object="${movie} è il nome dell'oggetto che gli passo grazie al Controller
 * redirect ci evita che ricaricando la pagina viene rimandata la stessa richiesta precedente (Ad esempio un POST con dei dati) -> return "redirect:/movies";
 * 
 * MAPPING ASSOCIAZIONI:
 *- Associazioni Unilaterali: va messo uno dei @ solo nella classe proprietaria.
 *- Associazioni Bilaterali: parte proprietaria corrisponde alla tabella con la foreign key (in una OneToMany è la Many) e parte inversa
 * @OneToMany(mappedBy = "nome della variabile della parte inversa che implementa l'associazione")
   nella classe Order@ManyToOneprivate Customer customer;
   nella classe Customer@OneToMany(mappedBy = "customer")private List<Order> orders;

 * DEFAULT DI FETCH IN JPA:
 * @OneToMany -> LAZY
 * @ManyToMany -> LAZY
 * @ManyToOne -> EAGER
 * @OneToOne -> EAGER
 * 
 * Vincoli di unicità @Column(unique=true, nullable = false) , @Table(uniqueConstraints=@UniqueConstraint(columnNames={"firstname","lastname"}))
*
 * JPQL -> Linguaggio di Interrogazione da usare nei Repository -> Dynamic Queries, Named Queries, Natie Queries (SQL)
 * NameQuery -> @NamedQuery(name = "Product.findAllProducts", query = "SELECT p FROM Product p")

 * CRUDREPOSITORY COSTRUZIONE QUERY: 
 * findBy, countBy
 * Custom Query -> in JPQL @Query("select m from Movie m where …") 
					  List<Movie> findAllByStranaCondizione ();

 * 				-> in SQL @Query(value = "select ….", nativeQuery=true ) 
							List<Movie> findAllByStranaCondizione ();
	
					
				-> Query Parametriche (@Param nella dichiarazione del metodo per  indicare la corrispondenza tra i paramentri nella query e quelli del metodo)
				@Query("SELECT c FROM Customer c 
				WHERE c.firstName = :fName and c.lastName = :lName") 
				Iterable<Customer> findCustomerByNameAndSurnameParams(
									@Param("fName") String firstName,
									@Param("lName") String lastName
								);
	
	
				Custom Query con NamedQuery -> findByMyPersonalFirstName(String firstName);


 */



@Controller
public class MainController {

    @GetMapping("/")
    public String home() {
        return "index";
    }
}
