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

==========================================================================

Iterazione 2:

 * i box dei nuovi locker non sono cubici, occorre quindi gestire 3 dimensioni per ogni box
 * di conseguenza, un box può contenere il pacco solo se i suoi 3 lati stanno nel box
 * i pacchi sono tutti i a forma di parallelepipedo rettangolo

==========================================================================

Iterazione 3:

 * i proprietari degli hub possono dichiarare pieno il proprio punto di ritiro
 * da quel momento l'hub non può accettare alcun nuovo pacco, qualsiasi dimensione abbia
