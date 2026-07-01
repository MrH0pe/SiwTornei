-- ========================
-- TORNEI
-- ========================
INSERT INTO torneo (id, nome, anno, descrizione) VALUES (nextval('torneo_seq'), 'Coppa Castelli Romani', 2024, 'Torneo amatoriale tra le squadre dei Castelli Romani.');
INSERT INTO torneo (id, nome, anno, descrizione) VALUES (nextval('torneo_seq'), 'Coppa Castelli Romani', 2025, 'Seconda edizione della coppa tra i comuni dei Castelli Romani.');
INSERT INTO torneo (id, nome, anno, descrizione) VALUES (nextval('torneo_seq'), 'Trofeo Litorale', 2024, 'Torneo riservato alle squadre della costa laziale.');
INSERT INTO torneo (id, nome, anno, descrizione) VALUES (nextval('torneo_seq'), 'Trofeo Litorale', 2025, 'Seconda edizione del torneo del litorale.');
INSERT INTO torneo (id, nome, anno, descrizione) VALUES (nextval('torneo_seq'), 'Champions Amatori Roma', 2025, 'Il torneo più prestigioso tra le squadre amatoriali della capitale.');
INSERT INTO torneo (id, nome, anno, descrizione) VALUES (nextval('torneo_seq'), 'Champions Amatori Roma', 2026, 'Edizione 2026 della Champions Amatori.');
INSERT INTO torneo (id, nome, anno, descrizione) VALUES (nextval('torneo_seq'), 'Coppa Tiburtina', 2025, 'Torneo storico delle squadre della zona tiburtina.');
INSERT INTO torneo (id, nome, anno, descrizione) VALUES (nextval('torneo_seq'), 'Memorial Estate', 2024, 'Torneo estivo organizzato in memoria dei fondatori della lega amatoriale.');
INSERT INTO torneo (id, nome, anno, descrizione) VALUES (nextval('torneo_seq'), 'Memorial Estate', 2025, 'Seconda edizione del Memorial Estate.');
INSERT INTO torneo (id, nome, anno, descrizione) VALUES (nextval('torneo_seq'), 'Coppa dei Comuni', 2026, 'Torneo che coinvolge le rappresentative dei piccoli comuni della provincia.');
-- ========================
-- SQUADRE
-- ========================
INSERT INTO squadra (id, nome, citta, anno_di_fondazione) VALUES (nextval('squadra_seq'), 'Trastevere FC', 'Roma', 1985);
INSERT INTO squadra (id, nome, citta, anno_di_fondazione) VALUES (nextval('squadra_seq'), 'Garbatella United', 'Roma', 1992);
INSERT INTO squadra (id, nome, citta, anno_di_fondazione) VALUES (nextval('squadra_seq'), 'Testaccio Calcio', 'Roma', 1978);
INSERT INTO squadra (id, nome, citta, anno_di_fondazione) VALUES (nextval('squadra_seq'), 'Monteverde FC', 'Roma', 2001);
INSERT INTO squadra (id, nome, citta, anno_di_fondazione) VALUES (nextval('squadra_seq'), 'Ostia Mare Amatori', 'Ostia', 1995);
INSERT INTO squadra (id, nome, citta, anno_di_fondazione) VALUES (nextval('squadra_seq'), 'Tivoli Calcio', 'Tivoli', 1988);
INSERT INTO squadra (id, nome, citta, anno_di_fondazione) VALUES (nextval('squadra_seq'), 'Frascati United', 'Frascati', 1990);
INSERT INTO squadra (id, nome, citta, anno_di_fondazione) VALUES (nextval('squadra_seq'), 'Albano FC', 'Albano Laziale', 2005);
INSERT INTO squadra (id, nome, citta, anno_di_fondazione) VALUES (nextval('squadra_seq'), 'Velletri Calcio', 'Velletri', 1983);
INSERT INTO squadra (id, nome, citta, anno_di_fondazione) VALUES (nextval('squadra_seq'), 'Anzio Marina', 'Anzio', 1997);
INSERT INTO squadra (id, nome, citta, anno_di_fondazione) VALUES (nextval('squadra_seq'), 'Civitavecchia Sport', 'Civitavecchia', 1980);
INSERT INTO squadra (id, nome, citta, anno_di_fondazione) VALUES (nextval('squadra_seq'), 'Fiumicino FC', 'Fiumicino', 2010);
INSERT INTO squadra (id, nome, citta, anno_di_fondazione) VALUES (nextval('squadra_seq'), 'Nettuno Calcio', 'Nettuno', 1993);
INSERT INTO squadra (id, nome, citta, anno_di_fondazione) VALUES (nextval('squadra_seq'), 'Pomezia United', 'Pomezia', 1986);
INSERT INTO squadra (id, nome, citta, anno_di_fondazione) VALUES (nextval('squadra_seq'), 'Marino FC', 'Marino', 1999);
INSERT INTO squadra (id, nome, citta, anno_di_fondazione) VALUES (nextval('squadra_seq'), 'Genzano Calcio', 'Genzano di Roma', 1989);
INSERT INTO squadra (id, nome, citta, anno_di_fondazione) VALUES (nextval('squadra_seq'), 'Guidonia Sport Club', 'Guidonia', 2003);
INSERT INTO squadra (id, nome, citta, anno_di_fondazione) VALUES (nextval('squadra_seq'), 'Ladispoli FC', 'Ladispoli', 1991);
INSERT INTO squadra (id, nome, citta, anno_di_fondazione) VALUES (nextval('squadra_seq'), 'Bracciano Calcio', 'Bracciano', 1987);
INSERT INTO squadra (id, nome, citta, anno_di_fondazione) VALUES (nextval('squadra_seq'), 'Zagarolo United', 'Zagarolo', 2008);

-- ========================
-- GIOCATORI
-- ========================

-- Trastevere FC
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Marco', 'Rossi', '1995-03-12', 'Portiere', 188, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Luca', 'Bianchi', '1998-07-22', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Davide', 'Ferrari', '1997-11-05', 'Attaccante', 178, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));

-- Garbatella United
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Andrea', 'Romano', '1996-02-18', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Simone', 'Greco', '1999-09-30', 'Difensore', 185, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Matteo', 'Bruno', '1994-05-14', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));

-- Testaccio Calcio
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Francesco', 'Gallo', '1993-01-09', 'Portiere', 190, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Alessandro', 'Conti', '2000-06-25', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Riccardo', 'De Luca', '1997-12-03', 'Difensore', 183, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));

-- Monteverde FC
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Lorenzo', 'Mancini', '1998-04-11', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giovanni', 'Costa', '1995-08-19', 'Difensore', 186, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Tommaso', 'Marini', '1999-10-07', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));

-- Ostia Mare Amatori
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Stefano', 'Ricci', '1996-03-27', 'Portiere', 191, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Antonio', 'Lombardi', '1994-11-15', 'Difensore', 181, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Gabriele', 'Moretti', '2001-02-28', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));

-- Tivoli Calcio
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Federico', 'Barbieri', '1997-06-09', 'Centrocampista', 173, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emanuele', 'Fontana', '1999-01-21', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Daniele', 'Santoro', '1995-09-13', 'Attaccante', 178, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));

-- Frascati United
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Nicola', 'Esposito', '1998-12-30', 'Portiere', 189, (SELECT id FROM squadra WHERE nome = 'Frascati United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Vincenzo', 'Colombo', '1996-07-04', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Frascati United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Roberto', 'Rinaldi', '1993-04-17', 'Difensore', 187, (SELECT id FROM squadra WHERE nome = 'Frascati United'));

-- Albano FC
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Pietro', 'Caruso', '2000-08-23', 'Attaccante', 176, (SELECT id FROM squadra WHERE nome = 'Albano FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Christian', 'Pellegrini', '1997-05-06', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Albano FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Michele', 'Longo', '1999-02-14', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Albano FC'));

-- Velletri Calcio
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giuseppe', 'Leone', '1995-10-02', 'Portiere', 192, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Salvatore', 'Marchetti', '1994-03-29', 'Difensore', 183, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Claudio', 'Giordano', '1998-12-11', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));

-- Anzio Marina
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Fabio', 'Ferrara', '1996-06-20', 'Centrocampista', 177, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Alberto', 'Rizzo', '1999-09-08', 'Difensore', 185, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Paolo', 'Sanna', '1997-01-25', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));

-- Civitavecchia Sport
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Massimo', 'Farina', '1993-11-30', 'Portiere', 187, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Enrico', 'Serra', '1998-02-17', 'Difensore', 181, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Diego', 'Testa', '2000-07-19', 'Centrocampista', 173, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));

-- Fiumicino FC
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Cristian', 'Monti', '1997-04-05', 'Attaccante', 178, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Ivan', 'Donati', '1995-08-12', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Walter', 'Pagano', '1999-12-23', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));

-- Nettuno Calcio
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Mauro', 'Martino', '1996-09-27', 'Portiere', 190, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Sergio', 'Parisi', '1994-01-14', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Filippo', 'Villa', '1998-05-31', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));

-- Pomezia United
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Raffaele', 'Vitale', '1997-10-16', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Adriano', 'Cattaneo', '1999-03-02', 'Difensore', 186, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Carlo', 'Negri', '1995-06-28', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));

-- Marino FC
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Dario', 'Coppola', '1993-12-09', 'Portiere', 188, (SELECT id FROM squadra WHERE nome = 'Marino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Pasquale', 'D''Angelo', '1998-08-22', 'Difensore', 183, (SELECT id FROM squadra WHERE nome = 'Marino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Gennaro', 'Mariani', '2000-02-05', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Marino FC'));

-- Genzano Calcio
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Domenico', 'Orlando', '1996-04-18', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Bruno', 'Palumbo', '1994-09-25', 'Difensore', 185, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Renato', 'Cattani', '1997-07-13', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));

-- Guidonia Sport Club
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Ettore', 'Fabbri', '1999-11-01', 'Portiere', 191, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Ugo', 'Barone', '1995-01-27', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Maurizio', 'Pace', '1998-06-14', 'Attaccante', 178, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));

-- Ladispoli FC
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Leonardo', 'Russo', '1997-03-08', 'Centrocampista', 173, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Aldo', 'Marini', '1999-08-21', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Aurelio', 'Battaglia', '1996-12-04', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));

-- Bracciano Calcio
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Vittorio', 'Sartori', '1994-05-29', 'Portiere', 189, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Tiziano', 'Carrara', '1998-10-15', 'Difensore', 186, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Settimio', 'Valenti', '2001-01-09', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));

-- Zagarolo United
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Cesare', 'Amato', '1995-07-02', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emilio', 'Fiore', '1997-02-26', 'Difensore', 183, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Ottavio', 'Galli', '1999-04-10', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
-- ========================
-- TORNEO_SQUADRE (iscrizioni)
-- ========================

-- Coppa Castelli Romani 2024
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Velletri Calcio'), (SELECT id FROM torneo WHERE nome = 'Coppa Castelli Romani' AND anno = 2024));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Frascati United'), (SELECT id FROM torneo WHERE nome = 'Coppa Castelli Romani' AND anno = 2024));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Albano FC'), (SELECT id FROM torneo WHERE nome = 'Coppa Castelli Romani' AND anno = 2024));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Genzano Calcio'), (SELECT id FROM torneo WHERE nome = 'Coppa Castelli Romani' AND anno = 2024));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Marino FC'), (SELECT id FROM torneo WHERE nome = 'Coppa Castelli Romani' AND anno = 2024));

-- Coppa Castelli Romani 2025
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Velletri Calcio'), (SELECT id FROM torneo WHERE nome = 'Coppa Castelli Romani' AND anno = 2025));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Frascati United'), (SELECT id FROM torneo WHERE nome = 'Coppa Castelli Romani' AND anno = 2025));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Albano FC'), (SELECT id FROM torneo WHERE nome = 'Coppa Castelli Romani' AND anno = 2025));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Genzano Calcio'), (SELECT id FROM torneo WHERE nome = 'Coppa Castelli Romani' AND anno = 2025));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Marino FC'), (SELECT id FROM torneo WHERE nome = 'Coppa Castelli Romani' AND anno = 2025));

-- Trofeo Litorale 2024
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'), (SELECT id FROM torneo WHERE nome = 'Trofeo Litorale' AND anno = 2024));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Anzio Marina'), (SELECT id FROM torneo WHERE nome = 'Trofeo Litorale' AND anno = 2024));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'), (SELECT id FROM torneo WHERE nome = 'Trofeo Litorale' AND anno = 2024));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Fiumicino FC'), (SELECT id FROM torneo WHERE nome = 'Trofeo Litorale' AND anno = 2024));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'), (SELECT id FROM torneo WHERE nome = 'Trofeo Litorale' AND anno = 2024));

-- Champions Amatori Roma 2025
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Trastevere FC'), (SELECT id FROM torneo WHERE nome = 'Champions Amatori Roma' AND anno = 2025));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Garbatella United'), (SELECT id FROM torneo WHERE nome = 'Champions Amatori Roma' AND anno = 2025));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'), (SELECT id FROM torneo WHERE nome = 'Champions Amatori Roma' AND anno = 2025));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Monteverde FC'), (SELECT id FROM torneo WHERE nome = 'Champions Amatori Roma' AND anno = 2025));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Pomezia United'), (SELECT id FROM torneo WHERE nome = 'Champions Amatori Roma' AND anno = 2025));

-- Memorial Estate 2024
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'), (SELECT id FROM torneo WHERE nome = 'Memorial Estate' AND anno = 2024));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'), (SELECT id FROM torneo WHERE nome = 'Memorial Estate' AND anno = 2024));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Ladispoli FC'), (SELECT id FROM torneo WHERE nome = 'Memorial Estate' AND anno = 2024));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'), (SELECT id FROM torneo WHERE nome = 'Memorial Estate' AND anno = 2024));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Zagarolo United'), (SELECT id FROM torneo WHERE nome = 'Memorial Estate' AND anno = 2024));

-- Trofeo Litorale 2025
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'), (SELECT id FROM torneo WHERE nome = 'Trofeo Litorale' AND anno = 2025));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Anzio Marina'), (SELECT id FROM torneo WHERE nome = 'Trofeo Litorale' AND anno = 2025));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'), (SELECT id FROM torneo WHERE nome = 'Trofeo Litorale' AND anno = 2025));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Fiumicino FC'), (SELECT id FROM torneo WHERE nome = 'Trofeo Litorale' AND anno = 2025));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'), (SELECT id FROM torneo WHERE nome = 'Trofeo Litorale' AND anno = 2025));

-- Champions Amatori Roma 2026
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Trastevere FC'), (SELECT id FROM torneo WHERE nome = 'Champions Amatori Roma' AND anno = 2026));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Garbatella United'), (SELECT id FROM torneo WHERE nome = 'Champions Amatori Roma' AND anno = 2026));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'), (SELECT id FROM torneo WHERE nome = 'Champions Amatori Roma' AND anno = 2026));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Monteverde FC'), (SELECT id FROM torneo WHERE nome = 'Champions Amatori Roma' AND anno = 2026));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Pomezia United'), (SELECT id FROM torneo WHERE nome = 'Champions Amatori Roma' AND anno = 2026));

-- Coppa Tiburtina 2025
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'), (SELECT id FROM torneo WHERE nome = 'Coppa Tiburtina' AND anno = 2025));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'), (SELECT id FROM torneo WHERE nome = 'Coppa Tiburtina' AND anno = 2025));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Ladispoli FC'), (SELECT id FROM torneo WHERE nome = 'Coppa Tiburtina' AND anno = 2025));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'), (SELECT id FROM torneo WHERE nome = 'Coppa Tiburtina' AND anno = 2025));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Zagarolo United'), (SELECT id FROM torneo WHERE nome = 'Coppa Tiburtina' AND anno = 2025));

-- Memorial Estate 2025
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'), (SELECT id FROM torneo WHERE nome = 'Memorial Estate' AND anno = 2025));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'), (SELECT id FROM torneo WHERE nome = 'Memorial Estate' AND anno = 2025));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Ladispoli FC'), (SELECT id FROM torneo WHERE nome = 'Memorial Estate' AND anno = 2025));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'), (SELECT id FROM torneo WHERE nome = 'Memorial Estate' AND anno = 2025));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Zagarolo United'), (SELECT id FROM torneo WHERE nome = 'Memorial Estate' AND anno = 2025));

-- Coppa dei Comuni 2026
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Velletri Calcio'), (SELECT id FROM torneo WHERE nome = 'Coppa dei Comuni' AND anno = 2026));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Marino FC'), (SELECT id FROM torneo WHERE nome = 'Coppa dei Comuni' AND anno = 2026));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Genzano Calcio'), (SELECT id FROM torneo WHERE nome = 'Coppa dei Comuni' AND anno = 2026));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Albano FC'), (SELECT id FROM torneo WHERE nome = 'Coppa dei Comuni' AND anno = 2026));
INSERT INTO torneo_squadre (squadre_id, tornei_id) VALUES ((SELECT id FROM squadra WHERE nome = 'Frascati United'), (SELECT id FROM torneo WHERE nome = 'Coppa dei Comuni' AND anno = 2026));

-- ========================
-- ARBITRI
-- ========================
INSERT INTO arbitro (id, nome, cognome, codice_arbitrale) VALUES (nextval('arbitro_seq'), 'Giorgio', 'Bellini', 'ARB-001');
INSERT INTO arbitro (id, nome, cognome, codice_arbitrale) VALUES (nextval('arbitro_seq'), 'Walter', 'Sabatini', 'ARB-002');
INSERT INTO arbitro (id, nome, cognome, codice_arbitrale) VALUES (nextval('arbitro_seq'), 'Renzo', 'Calabrese', 'ARB-003');
INSERT INTO arbitro (id, nome, cognome, codice_arbitrale) VALUES (nextval('arbitro_seq'), 'Ivano', 'Tedesco', 'ARB-004');
INSERT INTO arbitro (id, nome, cognome, codice_arbitrale) VALUES (nextval('arbitro_seq'), 'Osvaldo', 'Benedetti', 'ARB-005');

-- ========================
-- PARTITE
-- ========================

-- Coppa Castelli Romani 2024 (PLAYED)
INSERT INTO partita (id, data_ora, luogo, goals_home, goals_away, stato, torneo_id, squadra_casa_id, squadra_ospite_id, arbitro_id) VALUES
(nextval('partita_seq'), '2024-04-12 16:00:00', 'Campo Sportivo Velletri', 2, 1, 1,
 (SELECT id FROM torneo WHERE nome = 'Coppa Castelli Romani' AND anno = 2024),
 (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'),
 (SELECT id FROM squadra WHERE nome = 'Frascati United'),
 (SELECT id FROM arbitro WHERE codice_arbitrale = 'ARB-001'));

-- Coppa Castelli Romani 2024 (SCHEDULED)
INSERT INTO partita (id, data_ora, luogo, goals_home, goals_away, stato, torneo_id, squadra_casa_id, squadra_ospite_id, arbitro_id) VALUES
(nextval('partita_seq'), '2026-07-19 17:30:00', 'Stadio Comunale Albano', 0, 0, 0,
 (SELECT id FROM torneo WHERE nome = 'Coppa Castelli Romani' AND anno = 2024),
 (SELECT id FROM squadra WHERE nome = 'Albano FC'),
 (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'),
 (SELECT id FROM arbitro WHERE codice_arbitrale = 'ARB-002'));

-- Coppa Castelli Romani 2025 (PLAYED)
INSERT INTO partita (id, data_ora, luogo, goals_home, goals_away, stato, torneo_id, squadra_casa_id, squadra_ospite_id, arbitro_id) VALUES
(nextval('partita_seq'), '2025-05-03 16:30:00', 'Campo Sportivo Marino', 3, 3, 1,
 (SELECT id FROM torneo WHERE nome = 'Coppa Castelli Romani' AND anno = 2025),
 (SELECT id FROM squadra WHERE nome = 'Marino FC'),
 (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'),
 (SELECT id FROM arbitro WHERE codice_arbitrale = 'ARB-003'));

-- Coppa Castelli Romani 2025 (SCHEDULED)
INSERT INTO partita (id, data_ora, luogo, goals_home, goals_away, stato, torneo_id, squadra_casa_id, squadra_ospite_id, arbitro_id) VALUES
(nextval('partita_seq'), '2026-08-02 18:00:00', 'Stadio Comunale Genzano', 0, 0, 0,
 (SELECT id FROM torneo WHERE nome = 'Coppa Castelli Romani' AND anno = 2025),
 (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'),
 (SELECT id FROM squadra WHERE nome = 'Frascati United'),
 (SELECT id FROM arbitro WHERE codice_arbitrale = 'ARB-004'));

-- Trofeo Litorale 2024 (PLAYED)
INSERT INTO partita (id, data_ora, luogo, goals_home, goals_away, stato, torneo_id, squadra_casa_id, squadra_ospite_id, arbitro_id) VALUES
(nextval('partita_seq'), '2024-06-15 18:00:00', 'Stadio Ostia Mare', 1, 0, 1,
 (SELECT id FROM torneo WHERE nome = 'Trofeo Litorale' AND anno = 2024),
 (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'),
 (SELECT id FROM squadra WHERE nome = 'Anzio Marina'),
 (SELECT id FROM arbitro WHERE codice_arbitrale = 'ARB-005'));

-- Trofeo Litorale 2024 (SCHEDULED)
INSERT INTO partita (id, data_ora, luogo, goals_home, goals_away, stato, torneo_id, squadra_casa_id, squadra_ospite_id, arbitro_id) VALUES
(nextval('partita_seq'), '2026-08-09 17:00:00', 'Campo Civitavecchia', 0, 0, 0,
 (SELECT id FROM torneo WHERE nome = 'Trofeo Litorale' AND anno = 2024),
 (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'),
 (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'),
 (SELECT id FROM arbitro WHERE codice_arbitrale = 'ARB-001'));

-- Trofeo Litorale 2025 (PLAYED)
INSERT INTO partita (id, data_ora, luogo, goals_home, goals_away, stato, torneo_id, squadra_casa_id, squadra_ospite_id, arbitro_id) VALUES
(nextval('partita_seq'), '2025-07-20 19:00:00', 'Stadio Nettuno', 2, 2, 1,
 (SELECT id FROM torneo WHERE nome = 'Trofeo Litorale' AND anno = 2025),
 (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'),
 (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'),
 (SELECT id FROM arbitro WHERE codice_arbitrale = 'ARB-002'));

-- Trofeo Litorale 2025 (SCHEDULED)
INSERT INTO partita (id, data_ora, luogo, goals_home, goals_away, stato, torneo_id, squadra_casa_id, squadra_ospite_id, arbitro_id) VALUES
(nextval('partita_seq'), '2026-08-16 17:30:00', 'Stadio Anzio Marina', 0, 0, 0,
 (SELECT id FROM torneo WHERE nome = 'Trofeo Litorale' AND anno = 2025),
 (SELECT id FROM squadra WHERE nome = 'Anzio Marina'),
 (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'),
 (SELECT id FROM arbitro WHERE codice_arbitrale = 'ARB-003'));

-- Champions Amatori Roma 2025 (PLAYED)
INSERT INTO partita (id, data_ora, luogo, goals_home, goals_away, stato, torneo_id, squadra_casa_id, squadra_ospite_id, arbitro_id) VALUES
(nextval('partita_seq'), '2025-03-08 15:00:00', 'Campo Trastevere', 4, 1, 1,
 (SELECT id FROM torneo WHERE nome = 'Champions Amatori Roma' AND anno = 2025),
 (SELECT id FROM squadra WHERE nome = 'Trastevere FC'),
 (SELECT id FROM squadra WHERE nome = 'Garbatella United'),
 (SELECT id FROM arbitro WHERE codice_arbitrale = 'ARB-004'));

-- Champions Amatori Roma 2025 (SCHEDULED)
INSERT INTO partita (id, data_ora, luogo, goals_home, goals_away, stato, torneo_id, squadra_casa_id, squadra_ospite_id, arbitro_id) VALUES
(nextval('partita_seq'), '2026-08-23 16:00:00', 'Campo Testaccio', 0, 0, 0,
 (SELECT id FROM torneo WHERE nome = 'Champions Amatori Roma' AND anno = 2025),
 (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'),
 (SELECT id FROM squadra WHERE nome = 'Monteverde FC'),
 (SELECT id FROM arbitro WHERE codice_arbitrale = 'ARB-005'));

-- Champions Amatori Roma 2026 (PLAYED)
INSERT INTO partita (id, data_ora, luogo, goals_home, goals_away, stato, torneo_id, squadra_casa_id, squadra_ospite_id, arbitro_id) VALUES
(nextval('partita_seq'), '2026-03-14 15:30:00', 'Campo Pomezia', 1, 1, 1,
 (SELECT id FROM torneo WHERE nome = 'Champions Amatori Roma' AND anno = 2026),
 (SELECT id FROM squadra WHERE nome = 'Pomezia United'),
 (SELECT id FROM squadra WHERE nome = 'Trastevere FC'),
 (SELECT id FROM arbitro WHERE codice_arbitrale = 'ARB-001'));

-- Champions Amatori Roma 2026 (SCHEDULED)
INSERT INTO partita (id, data_ora, luogo, goals_home, goals_away, stato, torneo_id, squadra_casa_id, squadra_ospite_id, arbitro_id) VALUES
(nextval('partita_seq'), '2026-08-30 17:00:00', 'Campo Garbatella', 0, 0, 0,
 (SELECT id FROM torneo WHERE nome = 'Champions Amatori Roma' AND anno = 2026),
 (SELECT id FROM squadra WHERE nome = 'Garbatella United'),
 (SELECT id FROM squadra WHERE nome = 'Monteverde FC'),
 (SELECT id FROM arbitro WHERE codice_arbitrale = 'ARB-002'));

-- Coppa Tiburtina 2025 (PLAYED)
INSERT INTO partita (id, data_ora, luogo, goals_home, goals_away, stato, torneo_id, squadra_casa_id, squadra_ospite_id, arbitro_id) VALUES
(nextval('partita_seq'), '2025-04-19 16:00:00', 'Campo Tivoli', 2, 0, 1,
 (SELECT id FROM torneo WHERE nome = 'Coppa Tiburtina' AND anno = 2025),
 (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'),
 (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'),
 (SELECT id FROM arbitro WHERE codice_arbitrale = 'ARB-003'));

-- Coppa Tiburtina 2025 (SCHEDULED)
INSERT INTO partita (id, data_ora, luogo, goals_home, goals_away, stato, torneo_id, squadra_casa_id, squadra_ospite_id, arbitro_id) VALUES
(nextval('partita_seq'), '2026-09-06 17:30:00', 'Campo Ladispoli', 0, 0, 0,
 (SELECT id FROM torneo WHERE nome = 'Coppa Tiburtina' AND anno = 2025),
 (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'),
 (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'),
 (SELECT id FROM arbitro WHERE codice_arbitrale = 'ARB-004'));
 
 

-- Memorial Estate 2024 (PLAYED)
INSERT INTO partita (id, data_ora, luogo, goals_home, goals_away, stato, torneo_id, squadra_casa_id, squadra_ospite_id, arbitro_id) VALUES
(nextval('partita_seq'), '2024-07-06 18:30:00', 'Campo Zagarolo', 3, 2, 1,
 (SELECT id FROM torneo WHERE nome = 'Memorial Estate' AND anno = 2024),
 (SELECT id FROM squadra WHERE nome = 'Zagarolo United'),
 (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'),
 (SELECT id FROM arbitro WHERE codice_arbitrale = 'ARB-005'));

-- Memorial Estate 2024 (SCHEDULED)
INSERT INTO partita (id, data_ora, luogo, goals_home, goals_away, stato, torneo_id, squadra_casa_id, squadra_ospite_id, arbitro_id) VALUES
(nextval('partita_seq'), '2026-09-13 17:00:00', 'Campo Guidonia', 0, 0, 0,
 (SELECT id FROM torneo WHERE nome = 'Memorial Estate' AND anno = 2024),
 (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'),
 (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'),
 (SELECT id FROM arbitro WHERE codice_arbitrale = 'ARB-001'));

-- Memorial Estate 2025 (PLAYED)
INSERT INTO partita (id, data_ora, luogo, goals_home, goals_away, stato, torneo_id, squadra_casa_id, squadra_ospite_id, arbitro_id) VALUES
(nextval('partita_seq'), '2025-07-12 18:00:00', 'Campo Bracciano', 0, 1, 1,
 (SELECT id FROM torneo WHERE nome = 'Memorial Estate' AND anno = 2025),
 (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'),
 (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'),
 (SELECT id FROM arbitro WHERE codice_arbitrale = 'ARB-002'));

-- Memorial Estate 2025 (SCHEDULED)
INSERT INTO partita (id, data_ora, luogo, goals_home, goals_away, stato, torneo_id, squadra_casa_id, squadra_ospite_id, arbitro_id) VALUES
(nextval('partita_seq'), '2026-09-20 17:30:00', 'Campo Sportivo Tivoli Centro', 0, 0, 0,
 (SELECT id FROM torneo WHERE nome = 'Memorial Estate' AND anno = 2025),
 (SELECT id FROM squadra WHERE nome = 'Zagarolo United'),
 (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'),
 (SELECT id FROM arbitro WHERE codice_arbitrale = 'ARB-003'));

-- Coppa dei Comuni 2026 (PLAYED)
INSERT INTO partita (id, data_ora, luogo, goals_home, goals_away, stato, torneo_id, squadra_casa_id, squadra_ospite_id, arbitro_id) VALUES
(nextval('partita_seq'), '2026-04-11 16:00:00', 'Stadio Comunale Marino Sud', 1, 2, 1,
 (SELECT id FROM torneo WHERE nome = 'Coppa dei Comuni' AND anno = 2026),
 (SELECT id FROM squadra WHERE nome = 'Marino FC'),
 (SELECT id FROM squadra WHERE nome = 'Albano FC'),
 (SELECT id FROM arbitro WHERE codice_arbitrale = 'ARB-004'));

-- Coppa dei Comuni 2026 (SCHEDULED)
INSERT INTO partita (id, data_ora, luogo, goals_home, goals_away, stato, torneo_id, squadra_casa_id, squadra_ospite_id, arbitro_id) VALUES
(nextval('partita_seq'), '2026-09-27 17:00:00', 'Campo Frascati Alto', 0, 0, 0,
 (SELECT id FROM torneo WHERE nome = 'Coppa dei Comuni' AND anno = 2026),
 (SELECT id FROM squadra WHERE nome = 'Frascati United'),
 (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'),
 (SELECT id FROM arbitro WHERE codice_arbitrale = 'ARB-005'));
 
-- Inserimento Utente
INSERT INTO users (id, nome, cognome, email) VALUES (100, 'daniele', 'pizza', 'danielepanz77@gmail.com');

-- Inserimento Credenziali (Ruolo ADMIN con hash estratto dal tuo database)
INSERT INTO credentials (id, username, password, role, user_id) VALUES (100, 'Dani', '$2a$10$7Ds3uiVGXz0blqONDFuRvORBQTpZm5rutk8yBQqRZTik7sXsvp4f.', 'ROLE_ADMIN', 100);

-- Inserimento Utente GioLai
INSERT INTO users (id, nome, cognome, email) VALUES (101, 'GioLai', 'GioLai', 'giorgio@informatica.it');

-- Inserimento Credenziali (Role DEFAULT)
INSERT INTO credentials (id, username, password, role, user_id) VALUES (101, 'GioLai', '$2a$10$nQICLvZDXLcC.guGV4Pczeycn50DTPp4MefHEUhQ6nRsy2JMB9S7u', 'ROLE_DEFAULT', 101);