/*
 * Componente React per la sezione commenti di una partita.
 *
 * COME FUNZIONA IN GENERALE:
 *   Thymeleaf genera la pagina HTML lato server e inserisce nel div#commenti-root
 *   alcune informazioni (id partita, utente loggato, token CSRF) come attributi data-*.
 *   Questo script le legge, monta il componente React su quel div, e da quel momento
 *   in poi gestisce i commenti in modo dinamico senza ricaricare la pagina.
 *
 * PERCHÉ React.createElement invece di JSX:
 *   Il JSX (la sintassi <Componente />) deve essere compilato da Babel prima di girare
 *   nel browser. Per evitare un build step (npm, webpack, ecc.) usiamo direttamente
 *   React.createElement(), che è esattamente quello che Babel produrrebbe.
 *   Esempio: <p>Ciao</p>  ===  React.createElement('p', null, 'Ciao')
 */

'use strict';

// Alias corto per non scrivere React.createElement ogni volta
const e = React.createElement;

/*
 * Formatta una data ISO (es. "2024-04-12T16:00:00") in formato italiano leggibile.
 * Esempio output: "12/04/2024 16:00"
 */
function formatData(isoString) {
    if (!isoString) return '';
    const d = new Date(isoString);
    return d.toLocaleDateString('it-IT') + ' ' + d.toLocaleTimeString('it-IT', { hour: '2-digit', minute: '2-digit' });
}

/*
 * Componente principale: mostra la lista commenti e il form per aggiungerne uno.
 *
 * Props ricevute dal div Thymeleaf:
 *   - partitaId   → id della partita, usato nelle chiamate API
 *   - currentUser → username dell'utente loggato (stringa vuota se non loggato)
 *   - isAdmin     → true se l'utente ha ruolo ADMIN
 *   - isLoggedIn  → true se c'è un utente loggato
 *   - csrfToken   → token anti-CSRF richiesto da Spring Security per POST e DELETE
 *   - csrfHeader  → nome dell'header in cui mandare il token (es. "X-CSRF-TOKEN")
 */
function CommentiSection({ partitaId, currentUser, isAdmin, isLoggedIn, csrfToken, csrfHeader }) {

    // useState: variabili di stato del componente. Ogni volta che cambiano, React ri-renderizza.
    const [commenti, setCommenti] = React.useState([]);   // lista commenti caricata dall'API
    const [testo, setTesto]       = React.useState('');   // testo digitato nel form
    const [loading, setLoading]   = React.useState(true); // true finché l'API non risponde
    const [invio, setInvio]       = React.useState(false);// true durante l'invio del form
    const [errore, setErrore]     = React.useState(null); // messaggio di errore, se presente

    /*
     * Chiama GET /api/partite/{id}/commenti e aggiorna lo stato con i dati ricevuti.
     * È una funzione separata così può essere richiamata dopo ogni aggiunta/eliminazione
     * per "aggiornare" la lista senza ricaricare la pagina.
     */
    function caricaCommenti() {
        fetch('/api/partite/' + partitaId + '/commenti')
            .then(function(res) { return res.json(); })
            .then(function(data) { setCommenti(data); setLoading(false); })
            .catch(function() { setErrore('Errore nel caricamento dei commenti.'); setLoading(false); });
    }

    /*
     * useEffect con array vuoto []: viene eseguito una sola volta, al montaggio del componente.
     * È equivalente a "esegui caricaCommenti() quando la pagina è pronta".
     */
    React.useEffect(function() { caricaCommenti(); }, []);

    /*
     * Chiamato quando l'utente clicca "Elimina" su un commento.
     * Manda DELETE /api/commenti/{id} con il token CSRF nell'header,
     * poi ricarica la lista se l'operazione va a buon fine.
     */
    function handleElimina(id) {
        if (!confirm('Eliminare il commento?')) return;
        var headers = { 'Content-Type': 'application/json' };
        headers[csrfHeader] = csrfToken; // Spring Security blocca DELETE senza questo token
        fetch('/api/commenti/' + id, { method: 'DELETE', headers: headers })
            .then(function(res) {
                if (res.ok) caricaCommenti();
                else setErrore('Impossibile eliminare il commento.');
            });
    }

    /*
     * Chiamato al submit del form "Lascia un commento".
     * Manda POST /api/partite/{id}/commenti con il testo come JSON,
     * poi svuota il campo e ricarica la lista.
     */
    function handleInvia(ev) {
        ev.preventDefault(); // impedisce il reload classico del form HTML
        if (!testo.trim()) return;
        setInvio(true);
        var headers = { 'Content-Type': 'application/json' };
        headers[csrfHeader] = csrfToken;
        fetch('/api/partite/' + partitaId + '/commenti', {
            method: 'POST',
            headers: headers,
            body: JSON.stringify({ testo: testo.trim() })
        }).then(function(res) {
            if (res.ok) { setTesto(''); caricaCommenti(); }
            else setErrore("Errore durante l'invio del commento.");
        }).finally(function() { setInvio(false); });
    }

    // Mentre l'API non ha ancora risposto, mostra un messaggio di attesa
    if (loading) return e('p', null, 'Caricamento commenti...');

    // Costruisce la lista dei commenti (o il messaggio "nessun commento")
    var listaEl = null;
    if (commenti.length === 0) {
        listaEl = e('div', { className: 'alert alert-info' }, 'Nessun commento per questa partita.');
    } else {
        listaEl = e('ul', { className: 'commenti-lista' },
            commenti.map(function(c) {
                // Bottoni azione: "Modifica" solo per l'autore non-admin, "Elimina" per autore o admin
                var actions = null;
                if (isLoggedIn) {
                    var btnModifica = (c.username === currentUser && !isAdmin)
                        ? e('a', { href: '/commenti/' + c.id + '/edit', className: 'btn btn-info' }, 'Modifica')
                        : null;
                    var btnElimina = (c.username === currentUser || isAdmin)
                        ? e('button', { className: 'btn btn-danger', onClick: function() { handleElimina(c.id); } }, 'Elimina')
                        : null;
                    if (btnModifica || btnElimina) {
                        actions = e('div', { className: 'commento-actions' }, btnModifica, btnElimina);
                    }
                }
                // Ogni <li> ha una key univoca: React la usa per aggiornare solo gli elementi cambiati
                return e('li', { key: c.id, className: 'commento-item' },
                    e('div', { className: 'commento-meta' },
                        e('strong', null, c.username),
                        ' — ',
                        e('span', null, formatData(c.dataCreazione))
                    ),
                    e('p', { className: 'commento-testo' }, c.testo),
                    actions
                );
            })
        );
    }

    // Form per aggiungere un commento: visibile solo agli utenti DEFAULT loggati
    var formEl = null;
    if (isLoggedIn && !isAdmin) {
        formEl = e('div', null,
            e('h3', null, 'Lascia un commento'),
            e('form', { onSubmit: handleInvia },
                e('label', { htmlFor: 'testo' }, 'Il tuo commento',
                    e('textarea', {
                        id: 'testo',
                        rows: 4,
                        placeholder: 'Scrivi qui...',
                        value: testo,
                        // onChange: aggiorna lo stato ad ogni tasto → React mantiene il campo "controllato"
                        onChange: function(ev) { setTesto(ev.target.value); }
                    })
                ),
                e('button', { type: 'submit', className: 'mt-16', disabled: invio },
                    invio ? 'Invio in corso...' : 'Invia commento'
                )
            )
        );
    }

    // Link al login: visibile solo agli utenti non loggati
    var loginEl = !isLoggedIn
        ? e('div', { className: 'alert alert-info' },
            e('a', { href: '/login' }, 'Accedi'),
            ' per lasciare un commento.'
          )
        : null;

    // Il componente restituisce l'albero di elementi da renderizzare nel div#commenti-root
    return e('div', null,
        e('h2', null, 'Commenti'),
        errore ? e('div', { className: 'alert alert-info' }, errore) : null,
        listaEl,
        formEl,
        loginEl
    );
}

/*
 * Punto di avvio: IIFE (funzione eseguita subito) che:
 *   1. Legge i dati dal div#commenti-root (scritti da Thymeleaf come attributi data-*)
 *   2. Crea il "root" React su quel div
 *   3. Renderizza il componente CommentiSection passandogli i dati come props
 *
 * Da questo momento in poi React controlla quel div: lo aggiorna automaticamente
 * ogni volta che lo stato (commenti, testo, loading…) cambia.
 */
(function() {
    var rootEl      = document.getElementById('commenti-root');
    var partitaId   = rootEl.dataset.partitaId;
    var currentUser = rootEl.dataset.username || '';
    var isAdmin     = rootEl.dataset.isAdmin === 'true';
    var isLoggedIn  = rootEl.dataset.loggedIn === 'true';
    var csrfToken   = rootEl.dataset.csrfToken;
    var csrfHeader  = rootEl.dataset.csrfHeader;

    var root = ReactDOM.createRoot(rootEl);
    root.render(e(CommentiSection, {
        partitaId: partitaId,
        currentUser: currentUser,
        isAdmin: isAdmin,
        isLoggedIn: isLoggedIn,
        csrfToken: csrfToken,
        csrfHeader: csrfHeader
    }));
})();
