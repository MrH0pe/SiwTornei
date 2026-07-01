package it.uniroma3.siw.torneo.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import it.uniroma3.siw.torneo.model.Torneo;

//findAll(), findById(Long id), save(Torneo t), deleteById(Long id), existsById(Long id), count()
public interface TorneoRepository extends CrudRepository<Torneo, Long>{
	boolean existsByNomeAndAnno(String nome, Integer anno);  //Ossia il vincolo che sta nel Model (@Table(uniqueConstraints))
	
	@Query("SELECT t FROM Torneo t LEFT JOIN FETCH t.squadre WHERE t.id = :id")
	Optional<Torneo> findByIdWithSquadre(@Param("id") Long id);
}
