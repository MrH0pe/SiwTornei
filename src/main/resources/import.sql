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
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Luca', 'Bianchi', '1998-07-22', 'Portiere', 185, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Davide', 'Ferrari', '1997-11-05', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Matteo', 'Esposito', '1996-05-18', 'Difensore', 180, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giorgio', 'Conti', '1999-02-14', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Alessio', 'Mancini', '1994-09-03', 'Difensore', 179, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Simone', 'Greco', '2000-01-27', 'Difensore', 177, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Nicola', 'Bruno', '1995-06-11', 'Difensore', 183, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Filippo', 'Romano', '1997-04-22', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Andrea', 'Gallo', '1998-10-09', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Francesco', 'Costa', '1996-12-30', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Lorenzo', 'Rinaldi', '1999-08-15', 'Centrocampista', 172, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Riccardo', 'De Luca', '2001-03-07', 'Centrocampista', 178, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Daniele', 'Barbieri', '1995-11-19', 'Centrocampista', 181, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Antonio', 'Fontana', '1997-07-08', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Gabriele', 'Moretti', '1993-02-28', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Stefano', 'Lombardi', '1999-05-17', 'Attaccante', 176, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giovanni', 'Caruso', '1996-09-24', 'Attaccante', 183, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Tommaso', 'Ferretti', '2000-04-13', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emanuele', 'Santoro', '1994-08-06', 'Attaccante', 175, (SELECT id FROM squadra WHERE nome = 'Trastevere FC'));

-- Garbatella United
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Andrea', 'Romano', '1996-02-18', 'Portiere', 187, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Pietro', 'Vitale', '1999-07-05', 'Portiere', 190, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Matteo', 'Bruno', '1994-05-14', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Luca', 'Pellegrini', '1997-11-29', 'Difensore', 179, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Simone', 'Marini', '2000-03-16', 'Difensore', 185, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Carlo', 'Negri', '1995-08-22', 'Difensore', 181, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Dario', 'Amato', '1998-01-09', 'Difensore', 178, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Adriano', 'Fiore', '1993-06-30', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Fabrizio', 'Ricci', '1996-10-11', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Massimo', 'Palumbo', '1999-04-27', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Enrico', 'Galli', '1997-09-03', 'Centrocampista', 177, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Claudio', 'Sartori', '2001-02-14', 'Centrocampista', 173, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Vittorio', 'Pace', '1994-12-20', 'Centrocampista', 180, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Tiziano', 'Coppola', '1998-07-18', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Roberto', 'Fabbri', '1995-03-08', 'Attaccante', 182, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giuseppe', 'Barone', '1997-11-01', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Salvatore', 'Valenti', '2000-06-25', 'Attaccante', 176, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Cesare', 'Battaglia', '1993-09-14', 'Attaccante', 181, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emilio', 'Donati', '1999-01-30', 'Attaccante', 178, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Leonardo', 'Cattaneo', '1996-05-07', 'Attaccante', 183, (SELECT id FROM squadra WHERE nome = 'Garbatella United'));

-- Testaccio Calcio
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Francesco', 'Gallo', '1993-01-09', 'Portiere', 190, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Marco', 'Serra', '1998-06-17', 'Portiere', 186, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Alessandro', 'Conti', '2000-06-25', 'Difensore', 180, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Riccardo', 'De Luca', '1997-12-03', 'Difensore', 183, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Luca', 'Orlando', '1995-04-20', 'Difensore', 179, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Matteo', 'Ferrara', '1999-09-11', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Simone', 'Russo', '1994-02-28', 'Difensore', 177, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giorgio', 'Monti', '2001-07-14', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Nicola', 'Pagano', '1996-11-05', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Filippo', 'Testa', '1998-03-22', 'Centrocampista', 173, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Andrea', 'Farina', '1997-08-09', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Daniele', 'Martino', '1995-01-31', 'Centrocampista', 178, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Federico', 'Parisi', '2000-10-16', 'Centrocampista', 181, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emanuele', 'Villa', '1993-05-08', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Antonio', 'Cattani', '1997-12-27', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Gabriele', 'Rizzo', '1999-04-04', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Roberto', 'Sanna', '1994-07-21', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Stefano', 'Mariani', '1996-09-12', 'Attaccante', 182, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Michele', 'Carrara', '2001-02-03', 'Attaccante', 175, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Christian', 'Benedetti', '1998-11-18', 'Attaccante', 183, (SELECT id FROM squadra WHERE nome = 'Testaccio Calcio'));

-- Monteverde FC
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Lorenzo', 'Mancini', '1998-04-11', 'Portiere', 189, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giovanni', 'Costa', '1995-08-19', 'Portiere', 186, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Tommaso', 'Marini', '1999-10-07', 'Difensore', 181, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Matteo', 'Leone', '1996-03-25', 'Difensore', 179, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Luca', 'Marchetti', '1994-12-14', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Simone', 'Giordano', '2000-07-02', 'Difensore', 178, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Andrea', 'Colombo', '1997-05-30', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giorgio', 'Esposito', '1993-10-17', 'Difensore', 177, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Nicola', 'Barbieri', '1998-01-22', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Filippo', 'Fontana', '1996-09-08', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Roberto', 'Ferretti', '1999-06-19', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Daniele', 'Russo', '2001-11-04', 'Centrocampista', 180, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Federico', 'Monti', '1994-04-28', 'Centrocampista', 173, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emanuele', 'Pagano', '1997-02-15', 'Centrocampista', 179, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Antonio', 'Testa', '1995-08-06', 'Attaccante', 181, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Gabriele', 'Farina', '1998-12-23', 'Attaccante', 178, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Stefano', 'Martino', '1993-03-10', 'Attaccante', 183, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Michele', 'Parisi', '2000-09-27', 'Attaccante', 176, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Christian', 'Villa', '1996-07-13', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Pietro', 'Rizzo', '1999-05-01', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Monteverde FC'));

-- Ostia Mare Amatori
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Stefano', 'Ricci', '1996-03-27', 'Portiere', 191, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Carlo', 'Negri', '1999-10-14', 'Portiere', 188, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Antonio', 'Lombardi', '1994-11-15', 'Difensore', 181, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Gabriele', 'Moretti', '2001-02-28', 'Difensore', 179, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Marco', 'Amato', '1997-06-09', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Luca', 'Fiore', '1995-01-20', 'Difensore', 180, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Simone', 'Galli', '1998-08-05', 'Difensore', 177, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Nicola', 'Coppola', '1993-04-22', 'Difensore', 183, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Filippo', 'D''Angelo', '1996-12-11', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Andrea', 'Mariani', '1999-05-30', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Roberto', 'Sartori', '2000-09-18', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Daniele', 'Carrara', '1994-02-07', 'Centrocampista', 172, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Federico', 'Valenti', '1997-07-25', 'Centrocampista', 178, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emanuele', 'Battaglia', '1995-11-03', 'Centrocampista', 181, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Antonio', 'Donati', '1998-03-19', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giuseppe', 'Cattaneo', '1996-10-08', 'Attaccante', 182, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Salvatore', 'Pace', '1993-07-16', 'Attaccante', 176, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Cesare', 'Fabbri', '2000-01-04', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emilio', 'Barone', '1999-06-22', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Leonardo', 'Ferrara', '1997-04-10', 'Attaccante', 183, (SELECT id FROM squadra WHERE nome = 'Ostia Mare Amatori'));

-- Tivoli Calcio
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Federico', 'Barbieri', '1997-06-09', 'Portiere', 192, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emanuele', 'Fontana', '1999-01-21', 'Portiere', 187, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Daniele', 'Santoro', '1995-09-13', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Marco', 'Rinaldi', '1998-04-30', 'Difensore', 179, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Luca', 'Gallo', '1993-11-17', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Simone', 'Conti', '2000-08-06', 'Difensore', 178, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Andrea', 'Ferrari', '1996-02-24', 'Difensore', 181, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giorgio', 'Mancini', '1994-07-13', 'Difensore', 177, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Nicola', 'Romano', '1997-12-01', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Filippo', 'Greco', '1999-05-18', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Roberto', 'Costa', '1995-10-05', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Daniele', 'Marini', '2001-03-22', 'Centrocampista', 180, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Stefano', 'Lombardi', '1994-01-09', 'Centrocampista', 173, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Michele', 'Moretti', '1997-08-27', 'Centrocampista', 178, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Christian', 'Ricci', '1996-04-15', 'Attaccante', 181, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Pietro', 'Esposito', '1998-09-04', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giuseppe', 'Colombo', '1993-06-21', 'Attaccante', 183, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Salvatore', 'De Luca', '2000-11-10', 'Attaccante', 176, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Cesare', 'Pellegrini', '1999-02-28', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emilio', 'Longo', '1996-07-07', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Tivoli Calcio'));

-- Frascati United
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Nicola', 'Esposito', '1998-12-30', 'Portiere', 189, (SELECT id FROM squadra WHERE nome = 'Frascati United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Vincenzo', 'Colombo', '1996-07-04', 'Portiere', 186, (SELECT id FROM squadra WHERE nome = 'Frascati United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Roberto', 'Rinaldi', '1993-04-17', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Frascati United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Marco', 'Vitale', '1997-09-02', 'Difensore', 180, (SELECT id FROM squadra WHERE nome = 'Frascati United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Luca', 'Amato', '1999-02-19', 'Difensore', 178, (SELECT id FROM squadra WHERE nome = 'Frascati United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Simone', 'Fiore', '1995-11-08', 'Difensore', 183, (SELECT id FROM squadra WHERE nome = 'Frascati United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Andrea', 'Galli', '2000-05-25', 'Difensore', 177, (SELECT id FROM squadra WHERE nome = 'Frascati United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giorgio', 'Coppola', '1994-08-14', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Frascati United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Nicola', 'Palumbo', '1997-03-03', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Frascati United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Filippo', 'Galli', '1999-10-20', 'Centrocampista', 173, (SELECT id FROM squadra WHERE nome = 'Frascati United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Roberto', 'Sartori', '1996-06-07', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Frascati United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Daniele', 'Carrara', '2001-01-24', 'Centrocampista', 179, (SELECT id FROM squadra WHERE nome = 'Frascati United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Federico', 'Valenti', '1994-09-11', 'Centrocampista', 181, (SELECT id FROM squadra WHERE nome = 'Frascati United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emanuele', 'Battaglia', '1998-04-28', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Frascati United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Antonio', 'Donati', '1995-12-16', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Frascati United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giuseppe', 'Cattaneo', '1997-07-05', 'Attaccante', 178, (SELECT id FROM squadra WHERE nome = 'Frascati United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Salvatore', 'Pace', '1993-02-22', 'Attaccante', 176, (SELECT id FROM squadra WHERE nome = 'Frascati United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Cesare', 'Fabbri', '2000-08-09', 'Attaccante', 182, (SELECT id FROM squadra WHERE nome = 'Frascati United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emilio', 'Barone', '1999-11-27', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Frascati United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Leonardo', 'Ferrara', '1996-05-14', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Frascati United'));

-- Albano FC
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Pietro', 'Caruso', '2000-08-23', 'Portiere', 190, (SELECT id FROM squadra WHERE nome = 'Albano FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Christian', 'Pellegrini', '1997-05-06', 'Portiere', 185, (SELECT id FROM squadra WHERE nome = 'Albano FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Michele', 'Longo', '1999-02-14', 'Difensore', 181, (SELECT id FROM squadra WHERE nome = 'Albano FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Marco', 'Russo', '1995-07-01', 'Difensore', 179, (SELECT id FROM squadra WHERE nome = 'Albano FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Luca', 'Romano', '1993-11-18', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Albano FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Simone', 'Ferrari', '1998-04-07', 'Difensore', 178, (SELECT id FROM squadra WHERE nome = 'Albano FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Andrea', 'Conti', '1996-09-24', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Albano FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giorgio', 'Bianchi', '2001-02-11', 'Difensore', 177, (SELECT id FROM squadra WHERE nome = 'Albano FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Nicola', 'Mancini', '1994-06-28', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Albano FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Filippo', 'Costa', '1997-01-15', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Albano FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Roberto', 'Marini', '1999-08-02', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Albano FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Daniele', 'Ricci', '1995-03-19', 'Centrocampista', 180, (SELECT id FROM squadra WHERE nome = 'Albano FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Federico', 'Greco', '2000-10-06', 'Centrocampista', 173, (SELECT id FROM squadra WHERE nome = 'Albano FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emanuele', 'Bruno', '1993-07-23', 'Centrocampista', 178, (SELECT id FROM squadra WHERE nome = 'Albano FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Antonio', 'Gallo', '1996-12-10', 'Attaccante', 181, (SELECT id FROM squadra WHERE nome = 'Albano FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giuseppe', 'De Luca', '1998-05-27', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Albano FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Salvatore', 'Barbieri', '1994-02-14', 'Attaccante', 183, (SELECT id FROM squadra WHERE nome = 'Albano FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Cesare', 'Fontana', '2001-09-01', 'Attaccante', 176, (SELECT id FROM squadra WHERE nome = 'Albano FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emilio', 'Santoro', '1999-04-18', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Albano FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Leonardo', 'Ferretti', '1997-11-05', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Albano FC'));

-- Velletri Calcio
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giuseppe', 'Leone', '1995-10-02', 'Portiere', 192, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Salvatore', 'Marchetti', '1994-03-29', 'Portiere', 187, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Claudio', 'Giordano', '1998-12-11', 'Difensore', 183, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Marco', 'Lombardi', '1996-05-28', 'Difensore', 180, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Luca', 'Moretti', '1999-01-15', 'Difensore', 178, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Simone', 'Ricci', '1993-08-04', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Andrea', 'Vitale', '2000-03-21', 'Difensore', 179, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giorgio', 'Amato', '1997-10-09', 'Difensore', 181, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Nicola', 'Fiore', '1995-04-26', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Filippo', 'Galli', '1998-11-13', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Roberto', 'Coppola', '1996-07-30', 'Centrocampista', 177, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Daniele', 'Mariani', '2001-02-17', 'Centrocampista', 173, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Federico', 'Sartori', '1994-09-04', 'Centrocampista', 180, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emanuele', 'Carrara', '1997-06-21', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Antonio', 'Valenti', '1999-12-08', 'Attaccante', 182, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giuseppe', 'Battaglia', '1996-03-25', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Salvatore', 'Donati', '1993-10-12', 'Attaccante', 183, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Cesare', 'Cattaneo', '2000-07-29', 'Attaccante', 176, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emilio', 'Pace', '1998-02-16', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Leonardo', 'Fabbri', '1995-05-03', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Velletri Calcio'));

-- Anzio Marina
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Fabio', 'Ferrara', '1996-06-20', 'Portiere', 190, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Alberto', 'Rizzo', '1999-09-08', 'Portiere', 186, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Paolo', 'Sanna', '1997-01-25', 'Difensore', 183, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Marco', 'Esposito', '1994-06-12', 'Difensore', 180, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Luca', 'Colombo', '1998-11-29', 'Difensore', 178, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Simone', 'Romano', '1995-04-18', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Andrea', 'Ferrari', '2000-09-05', 'Difensore', 179, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giorgio', 'Rinaldi', '1993-02-22', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Nicola', 'Gallo', '1997-07-09', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Filippo', 'Conti', '1999-12-26', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Roberto', 'Costa', '1996-08-13', 'Centrocampista', 177, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Daniele', 'Marini', '2001-03-30', 'Centrocampista', 173, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Federico', 'Lombardi', '1994-10-17', 'Centrocampista', 179, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emanuele', 'Moretti', '1997-05-04', 'Centrocampista', 181, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Antonio', 'Greco', '1995-12-21', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giuseppe', 'Bruno', '1998-07-08', 'Attaccante', 178, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Salvatore', 'De Luca', '1993-02-25', 'Attaccante', 176, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Cesare', 'Pellegrini', '2000-09-11', 'Attaccante', 183, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emilio', 'Longo', '1999-04-28', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Leonardo', 'Caruso', '1996-11-15', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Anzio Marina'));

-- Civitavecchia Sport
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Massimo', 'Farina', '1993-11-30', 'Portiere', 187, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Enrico', 'Serra', '1998-02-17', 'Portiere', 184, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Diego', 'Testa', '2000-07-19', 'Difensore', 181, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Marco', 'Russo', '1996-03-06', 'Difensore', 179, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Luca', 'Bianchi', '1994-10-23', 'Difensore', 183, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Simone', 'Conti', '1999-05-10', 'Difensore', 178, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Andrea', 'Ferrari', '1997-12-27', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giorgio', 'Mancini', '1995-07-14', 'Difensore', 177, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Nicola', 'Romano', '1998-01-31', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Filippo', 'Greco', '2000-08-18', 'Centrocampista', 173, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Roberto', 'Costa', '1993-03-05', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Daniele', 'Marini', '1996-10-22', 'Centrocampista', 180, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Federico', 'Barbieri', '1999-06-09', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emanuele', 'Fontana', '1997-01-26', 'Centrocampista', 178, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Antonio', 'Santoro', '1994-08-13', 'Attaccante', 181, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giuseppe', 'Ferretti', '1998-11-30', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Salvatore', 'Rinaldi', '2001-04-17', 'Attaccante', 183, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Cesare', 'De Luca', '1995-09-04', 'Attaccante', 176, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emilio', 'Gallo', '1997-02-21', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Leonardo', 'Pellegrini', '1999-07-08', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Civitavecchia Sport'));

-- Fiumicino FC
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Cristian', 'Monti', '1997-04-05', 'Portiere', 189, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Ivan', 'Donati', '1995-08-12', 'Portiere', 185, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Walter', 'Pagano', '1999-12-23', 'Difensore', 181, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Marco', 'Vitale', '1994-05-10', 'Difensore', 179, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Luca', 'Amato', '1998-10-27', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Simone', 'Fiore', '1996-03-14', 'Difensore', 178, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Andrea', 'Galli', '2000-08-01', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giorgio', 'Coppola', '1993-12-18', 'Difensore', 177, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Nicola', 'Palumbo', '1997-07-05', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Filippo', 'Sartori', '1999-02-22', 'Centrocampista', 173, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Roberto', 'Carrara', '1995-09-09', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Daniele', 'Valenti', '2001-04-26', 'Centrocampista', 180, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Federico', 'Battaglia', '1994-11-13', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emanuele', 'Ferrara', '1997-06-30', 'Centrocampista', 178, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Antonio', 'Rizzo', '1996-01-17', 'Attaccante', 181, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giuseppe', 'Sanna', '1998-08-04', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Salvatore', 'Cattani', '1993-03-21', 'Attaccante', 183, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Cesare', 'Pace', '2000-10-08', 'Attaccante', 176, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emilio', 'Fabbri', '1999-05-25', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Leonardo', 'Barone', '1996-12-12', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Fiumicino FC'));

-- Nettuno Calcio
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Mauro', 'Martino', '1996-09-27', 'Portiere', 190, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Sergio', 'Parisi', '1994-01-14', 'Portiere', 186, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Filippo', 'Villa', '1998-05-31', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Marco', 'Lombardi', '1995-10-18', 'Difensore', 179, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Luca', 'Moretti', '1999-03-05', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Simone', 'Ricci', '1993-07-22', 'Difensore', 178, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Andrea', 'Vitale', '2000-12-09', 'Difensore', 181, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giorgio', 'Amato', '1997-04-26', 'Difensore', 177, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Nicola', 'Fiore', '1996-11-13', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Filippo', 'Galli', '1998-06-30', 'Centrocampista', 173, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Roberto', 'Coppola', '1994-01-17', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Daniele', 'Mariani', '2001-08-04', 'Centrocampista', 180, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Federico', 'Sartori', '1995-02-21', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emanuele', 'Carrara', '1997-09-07', 'Centrocampista', 178, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Antonio', 'Valenti', '1999-04-24', 'Attaccante', 181, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giuseppe', 'Battaglia', '1993-11-11', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Salvatore', 'Donati', '2000-06-28', 'Attaccante', 183, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Cesare', 'Cattaneo', '1996-01-15', 'Attaccante', 176, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emilio', 'Pace', '1998-08-02', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Leonardo', 'Fabbri', '1995-03-19', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Nettuno Calcio'));

-- Pomezia United
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Raffaele', 'Vitale', '1997-10-16', 'Portiere', 188, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Adriano', 'Cattaneo', '1999-03-02', 'Portiere', 185, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Carlo', 'Negri', '1995-06-28', 'Difensore', 181, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Marco', 'Russo', '1998-01-15', 'Difensore', 179, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Luca', 'Ferrari', '1993-08-02', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Simone', 'Bianchi', '2000-02-19', 'Difensore', 178, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Andrea', 'Esposito', '1996-07-06', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giorgio', 'Conti', '1994-11-23', 'Difensore', 177, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Nicola', 'Romano', '1997-04-10', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Filippo', 'Greco', '1999-11-27', 'Centrocampista', 173, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Roberto', 'Mancini', '1995-06-14', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Daniele', 'Costa', '2001-01-01', 'Centrocampista', 180, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Federico', 'Marini', '1993-07-18', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emanuele', 'Ricci', '1996-12-05', 'Centrocampista', 178, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Antonio', 'Barbieri', '1998-04-22', 'Attaccante', 181, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giuseppe', 'Fontana', '1994-09-09', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Salvatore', 'Ferretti', '2000-02-26', 'Attaccante', 183, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Cesare', 'Santoro', '1997-07-13', 'Attaccante', 176, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emilio', 'Rinaldi', '1995-11-30', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Leonardo', 'De Luca', '1999-06-17', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Pomezia United'));

-- Marino FC
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Dario', 'Coppola', '1993-12-09', 'Portiere', 188, (SELECT id FROM squadra WHERE nome = 'Marino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Pasquale', 'D''Angelo', '1998-08-22', 'Portiere', 185, (SELECT id FROM squadra WHERE nome = 'Marino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Gennaro', 'Mariani', '2000-02-05', 'Difensore', 181, (SELECT id FROM squadra WHERE nome = 'Marino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Marco', 'Lombardi', '1995-07-22', 'Difensore', 179, (SELECT id FROM squadra WHERE nome = 'Marino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Luca', 'Moretti', '1999-01-09', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Marino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Simone', 'Ricci', '1994-06-26', 'Difensore', 178, (SELECT id FROM squadra WHERE nome = 'Marino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Andrea', 'Vitale', '1997-11-14', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Marino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giorgio', 'Amato', '1996-03-31', 'Difensore', 177, (SELECT id FROM squadra WHERE nome = 'Marino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Nicola', 'Fiore', '1998-10-17', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Marino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Filippo', 'Galli', '2001-05-04', 'Centrocampista', 173, (SELECT id FROM squadra WHERE nome = 'Marino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Roberto', 'Coppola', '1993-12-21', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Marino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Daniele', 'Palumbo', '1997-07-08', 'Centrocampista', 180, (SELECT id FROM squadra WHERE nome = 'Marino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Federico', 'Orlando', '1995-01-25', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Marino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emanuele', 'Cattani', '1999-08-11', 'Centrocampista', 178, (SELECT id FROM squadra WHERE nome = 'Marino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Antonio', 'Ferrara', '1996-02-28', 'Attaccante', 181, (SELECT id FROM squadra WHERE nome = 'Marino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giuseppe', 'Rizzo', '1994-09-15', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Marino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Salvatore', 'Sanna', '2000-04-02', 'Attaccante', 183, (SELECT id FROM squadra WHERE nome = 'Marino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Cesare', 'Farina', '1997-11-19', 'Attaccante', 176, (SELECT id FROM squadra WHERE nome = 'Marino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emilio', 'Martino', '1995-06-06', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Marino FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Leonardo', 'Parisi', '1998-03-23', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Marino FC'));

-- Genzano Calcio
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Domenico', 'Orlando', '1996-04-18', 'Portiere', 190, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Bruno', 'Palumbo', '1994-09-25', 'Portiere', 186, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Renato', 'Cattani', '1997-07-13', 'Difensore', 183, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Marco', 'Russo', '1999-02-28', 'Difensore', 180, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Luca', 'Ferrari', '1995-09-15', 'Difensore', 178, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Simone', 'Bianchi', '1993-04-02', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Andrea', 'Conti', '2000-10-19', 'Difensore', 179, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giorgio', 'Mancini', '1998-05-06', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Nicola', 'Costa', '1996-12-23', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Filippo', 'Marini', '1999-07-10', 'Centrocampista', 173, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Roberto', 'Barbieri', '1994-01-27', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Daniele', 'Fontana', '1997-08-13', 'Centrocampista', 180, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Federico', 'Santoro', '2001-02-28', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emanuele', 'Ferretti', '1995-09-16', 'Centrocampista', 178, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Antonio', 'Ricci', '1998-04-03', 'Attaccante', 181, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giuseppe', 'Vitale', '1993-10-20', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Salvatore', 'Amato', '2000-05-07', 'Attaccante', 183, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Cesare', 'Fiore', '1996-12-24', 'Attaccante', 176, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emilio', 'Galli', '1999-07-11', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Leonardo', 'Coppola', '1997-02-28', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Genzano Calcio'));

-- Guidonia Sport Club
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Ettore', 'Fabbri', '1999-11-01', 'Portiere', 191, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Ugo', 'Barone', '1995-01-27', 'Portiere', 187, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Maurizio', 'Pace', '1998-06-14', 'Difensore', 183, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Marco', 'Russo', '1993-11-01', 'Difensore', 180, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Luca', 'Ferrari', '1997-03-18', 'Difensore', 178, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Simone', 'Conti', '2000-08-05', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Andrea', 'Bianchi', '1995-12-22', 'Difensore', 179, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giorgio', 'Esposito', '1994-05-09', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Nicola', 'Colombo', '1998-10-26', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Filippo', 'Rinaldi', '1996-04-13', 'Centrocampista', 173, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Roberto', 'Gallo', '1999-11-29', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Daniele', 'De Luca', '2001-06-16', 'Centrocampista', 180, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Federico', 'Pellegrini', '1993-01-03', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emanuele', 'Longo', '1997-08-19', 'Centrocampista', 178, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Antonio', 'Barbieri', '1995-02-06', 'Attaccante', 181, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giuseppe', 'Fontana', '1998-07-23', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Salvatore', 'Santoro', '1994-12-10', 'Attaccante', 183, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Cesare', 'Ferretti', '2000-04-27', 'Attaccante', 176, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emilio', 'Ricci', '1996-09-14', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Leonardo', 'Caruso', '1999-01-31', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Guidonia Sport Club'));

-- Ladispoli FC
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Leonardo', 'Russo', '1997-03-08', 'Portiere', 189, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Aldo', 'Marini', '1999-08-21', 'Portiere', 185, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Aurelio', 'Battaglia', '1996-12-04', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Marco', 'Ferrari', '1994-04-21', 'Difensore', 179, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Luca', 'Conti', '1998-11-08', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Simone', 'Bianchi', '1995-05-25', 'Difensore', 178, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Andrea', 'Romano', '2000-12-12', 'Difensore', 181, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giorgio', 'Greco', '1993-06-29', 'Difensore', 177, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Nicola', 'Mancini', '1997-01-16', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Filippo', 'Costa', '1999-08-02', 'Centrocampista', 173, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Roberto', 'Marini', '1994-02-19', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Daniele', 'Ricci', '1996-09-05', 'Centrocampista', 180, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Federico', 'Lombardi', '2001-03-22', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emanuele', 'Moretti', '1995-10-09', 'Centrocampista', 178, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Antonio', 'Greco', '1998-04-26', 'Attaccante', 181, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giuseppe', 'Bruno', '1993-11-13', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Salvatore', 'De Luca', '2000-06-30', 'Attaccante', 183, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Cesare', 'Pellegrini', '1997-01-17', 'Attaccante', 176, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emilio', 'Longo', '1995-08-03', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Ottavio', 'Caruso', '1999-02-20', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Ladispoli FC'));

-- Bracciano Calcio
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Vittorio', 'Sartori', '1994-05-29', 'Portiere', 189, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Tiziano', 'Carrara', '1998-10-15', 'Portiere', 185, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Settimio', 'Valenti', '2001-01-09', 'Difensore', 181, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Marco', 'Russo', '1995-06-26', 'Difensore', 179, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Luca', 'Ferrari', '1999-01-13', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Simone', 'Conti', '1993-07-30', 'Difensore', 178, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Andrea', 'Bianchi', '1997-02-17', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giorgio', 'Mancini', '1996-09-03', 'Difensore', 177, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Nicola', 'Romano', '1998-03-20', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Filippo', 'Greco', '2000-10-06', 'Centrocampista', 173, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Roberto', 'Costa', '1994-04-23', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Daniele', 'Marini', '1997-11-09', 'Centrocampista', 180, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Federico', 'Barbieri', '1995-05-27', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emanuele', 'Fontana', '1999-12-13', 'Centrocampista', 178, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Antonio', 'Santoro', '1993-06-30', 'Attaccante', 181, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giuseppe', 'Ferretti', '1996-01-17', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Salvatore', 'Rinaldi', '2000-08-03', 'Attaccante', 183, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Cesare', 'De Luca', '1998-02-20', 'Attaccante', 176, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emilio', 'Gallo', '1994-09-06', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Leonardo', 'Pellegrini', '1997-04-24', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Bracciano Calcio'));

-- Zagarolo United
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Cesare', 'Amato', '1995-07-02', 'Portiere', 191, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emilio', 'Fiore', '1997-02-26', 'Portiere', 187, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Ottavio', 'Galli', '1999-04-10', 'Difensore', 183, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Marco', 'Russo', '1994-10-27', 'Difensore', 180, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Luca', 'Ferrari', '1998-03-14', 'Difensore', 178, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Simone', 'Conti', '1996-08-01', 'Difensore', 184, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Andrea', 'Bianchi', '2000-01-18', 'Difensore', 179, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giorgio', 'Mancini', '1993-05-05', 'Difensore', 182, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Nicola', 'Romano', '1997-12-21', 'Centrocampista', 175, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Filippo', 'Greco', '1999-07-08', 'Centrocampista', 173, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Roberto', 'Costa', '1995-01-25', 'Centrocampista', 176, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Daniele', 'Marini', '1993-08-11', 'Centrocampista', 180, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Federico', 'Barbieri', '1998-02-28', 'Centrocampista', 174, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Emanuele', 'Fontana', '2001-09-14', 'Centrocampista', 178, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Antonio', 'Santoro', '1996-03-31', 'Attaccante', 181, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Giuseppe', 'Ferretti', '1994-10-18', 'Attaccante', 179, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Salvatore', 'Rinaldi', '1999-05-04', 'Attaccante', 183, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Lorenzo', 'De Luca', '1997-12-20', 'Attaccante', 176, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Tiziano', 'Gallo', '1995-07-07', 'Attaccante', 180, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
INSERT INTO giocatore (id, nome, cognome, data_di_nascita, ruolo, altezza, squadra_id) VALUES (nextval('giocatore_seq'), 'Vittorio', 'Pellegrini', '1998-01-24', 'Attaccante', 177, (SELECT id FROM squadra WHERE nome = 'Zagarolo United'));
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