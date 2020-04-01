Sviluppare un "DeliveryService" che gestisce la consegna di pacchi acquistati da un cliente.

Quando un cliente acquista un prodotto può scegliere che esso venga consegnato in uno dei punti di ritiro disponibili.

Ci sono due tipi di punti di ritiro:
 - gli hub
 - i locker

Gli "hub" che possono accettare pacchi senza limiti di dimensione e senza limiti di numero.

I "locker" che possono accettare un pacco solo se hanno a disposizione un box libero abbastanza grande da contenerlo.

Scrivere un servizio che, data la dimensione del pacco:
 * restituisca l'elenco dei punti di ritiro disponibili
 * consenta di prenotare uno dei suddetti punti, occupandolo

Note:

 * Ad ogni punto di ritiro è associato un nome in codice univoco
 * La dimensione del pacco è espressa da un unico numero che rappresenta la misura del lato più lungo del pacco
 * I box nei locker sono cubici e possono contenere solo pacchi con lato più lungo minore o uguale al lato del box
 * Ogni locker ha più box che possono avere dimensioni diverse

==========================================================================

Iterazione 2: "Hub pieno"

 * i proprietari degli hub possono dichiarare pieno il proprio punto di ritiro
 * da quel momento l'hub non può accettare alcun nuovo pacco, qualsiasi dimensione abbia

==========================================================================

Iterazione 3: "Box non cubici"

 * i box dei nuovi locker non sono cubici, occorre quindi gestire 3 dimensioni per ogni box
 * di conseguenza, un box può contenere il pacco solo se i suoi 3 lati stanno nel box
 * i pacchi sono tutti a forma di parallelepipedo rettangolo

==========================================================================

Iterazione 4: "Prioritizzazione lockers"

* si vuole ottimizzare lo spazio occupato nei locker
* la lista dei punti di ritrovo disponibili diventa ordinata prioritizzando quelli in cui si occuperà meno spazio (il box più piccolo)
* gli hub liberi vengono restituiti sempre in fondo alla lista di punti proposti

==========================================================================

Iterazione 5: "Supporto lotti"

* si aggiunge il supporto a "lotti di pacchi"
* il servizio prenderà in input molteplici pacchi, si assume siano per lo stesso destinatario
* si vuole prioritizzare box in cui i pacchi stanno tutti insieme
* in caso non sia possibile occupare un solo box, si prioritizza il locker in cui si occuperà numero minore di box
* a parità di numero di box occupati, si prioritizza secondo regola di iterazione precedente
* gli hub liberi vengono restituiti sempre in fondo alla lista di punti proposti
