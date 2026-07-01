package it.uniroma3.siw.torneo.repository;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import it.uniroma3.siw.torneo.model.Partita;
import it.uniroma3.siw.torneo.model.Torneo;

public interface PartitaRepository extends CrudRepository<Partita, Long>{
	List<Partita> findAllByTorneo(Torneo torneo);
	
	boolean existsByLuogoAndDataOra(String luogo, LocalDateTime dataOra);
}
