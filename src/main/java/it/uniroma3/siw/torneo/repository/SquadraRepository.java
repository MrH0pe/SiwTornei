package it.uniroma3.siw.torneo.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import it.uniroma3.siw.torneo.model.Squadra;

public interface SquadraRepository extends CrudRepository<Squadra, Long>{
	boolean existsByNomeAndCitta(String nome,String citta);
	
	//JOIN FETCH
	@Query("SELECT s FROM Squadra s LEFT JOIN FETCH s.giocatori WHERE s.id = :id")
	Optional<Squadra> findByIdWithGiocatori(@Param("id") Long id);
	
}
