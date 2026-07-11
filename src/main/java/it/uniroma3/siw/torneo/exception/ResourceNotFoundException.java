package it.uniroma3.siw.torneo.exception;

/*
 * Eccezione custom lanciata dai controller quando una risorsa richiesta
 * (torneo, squadra, partita, ...) non esiste nel database.
 *
 * È una RuntimeException (unchecked) così i controller possono lanciarla
 * senza dichiarare "throws" nella firma dei metodi.
 * Viene intercettata dal GlobalExceptionHandler che mostra la pagina 404
 * con il messaggio personalizzato passato al costruttore.
 */
public class ResourceNotFoundException extends RuntimeException {

    public ResourceNotFoundException(String messaggio) {
        super(messaggio);
    }
}
