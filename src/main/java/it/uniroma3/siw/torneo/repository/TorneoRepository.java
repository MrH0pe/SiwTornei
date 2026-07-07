package it.uniroma3.siw.torneo.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import it.uniroma3.siw.torneo.model.Torneo;

//findAll(), findById(Long id), save(Torneo t), deleteById(Long id), existsById(Long id), count()
public interface TorneoRepository extends CrudRepository<Torneo, Long>{
	boolean existsByNomeAndAnno(String nome, Integer anno);  //Ossia il vincolo che sta nel Model (@Table(uniqueConstraints))

	//Strategia 1 (default): findById() -> squadre LAZY, caricate con una query aggiuntiva al primo accesso

	//Strategia 2: JOIN FETCH -> torneo + squadre in una sola query SQL
	@Query("SELECT t FROM Torneo t LEFT JOIN FETCH t.squadre WHERE t.id = :id")
	Optional<Torneo> findByIdWithSquadre(@Param("id") Long id);

	//Strategia 3: EntityGraph -> stesso effetto del JOIN FETCH ma dichiarativo,
	//Hibernate genera da solo la join sugli attributi indicati
	@EntityGraph(attributePaths = "squadre")
	@Query("SELECT t FROM Torneo t WHERE t.id = :id")
	Optional<Torneo> findByIdWithSquadreEntityGraph(@Param("id") Long id);
}
