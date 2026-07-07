package it.uniroma3.siw.torneo.repository;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import it.uniroma3.siw.torneo.model.Partita;
import it.uniroma3.siw.torneo.model.Torneo;

public interface PartitaRepository extends CrudRepository<Partita, Long>{
	//Strategia 1 (default): i @ManyToOne di Partita sono EAGER -> Hibernate esegue
	//query aggiuntive per torneo/squadre/arbitro di ogni partita (problema N+1)
	List<Partita> findAllByTorneo(Torneo torneo);

	boolean existsByLuogoAndDataOra(String luogo, LocalDateTime dataOra);

	//Strategia 2: JOIN FETCH -> tutte le associazioni caricate in una sola query SQL
	@Query("SELECT p FROM Partita p LEFT JOIN FETCH p.torneo LEFT JOIN FETCH p.squadraCasa "
			+ "LEFT JOIN FETCH p.squadraOspite LEFT JOIN FETCH p.arbitro")
	List<Partita> findAllWithRelazioni();

	@Query("SELECT p FROM Partita p LEFT JOIN FETCH p.torneo LEFT JOIN FETCH p.squadraCasa "
			+ "LEFT JOIN FETCH p.squadraOspite LEFT JOIN FETCH p.arbitro WHERE p.torneo = :torneo")
	List<Partita> findAllByTorneoWithRelazioni(@Param("torneo") Torneo torneo);

	//Strategia 3: EntityGraph -> equivalente dichiarativo del JOIN FETCH
	@EntityGraph(attributePaths = {"torneo", "squadraCasa", "squadraOspite", "arbitro"})
	@Query("SELECT p FROM Partita p WHERE p.torneo = :torneo")
	List<Partita> findAllByTorneoWithEntityGraph(@Param("torneo") Torneo torneo);
}
