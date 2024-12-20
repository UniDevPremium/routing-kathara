Abbiamo allocato le LAN cittadine in ordine di grandezza, ora organizziamo le tabelle di routing le seguendo le seguenti regole :
    - tra i router di bordo il traffico scorre solo in senso orario;
    - messaggi con destinazione fuori dalla reta 130.63.0.0/16 vengono inviati all'ISP;


## Requisiti
Abbiamo allocato le LAN cittadine in ordine di grandezza, ora organizziamo le tabelle di routing le seguendo le seguenti regole :
    - tra i router di bordo il traffico scorre solo in senso orario;
    - messaggi con destinazione fuori dalla reta 130.63.0.0/16 vengono inviati all'ISP;

Le comunicazioni da simulare sono:
 - ISP-Città, R1 riceve dall'ISP e trasmette verso il router posizionato in angolo che minimizza il numero di hop fino alla Città;
 - Città-ISP, il router di bordo riceve dalla Città e trasmette , se necessario, verso il successivo router posizionato in angolo, questo trasmette ad R1 che invia verso l'ISP.

## Routing di R1
IL router R1 fa collega la rete con l'ISP, richiede un accurata gestione delle rotte al fine di minimizzarne il numero.

Per mantenere i percorsi il più brevi possibile occorre instradare verso ogni router in angolo, i pacchetti destinati alle LAN che sono connesse ad esso ed a quello successivo in senso orario :

- Roma, Pavia, Fiuggi verso R2;
- Lodi, Gela, Imola verso R4;
- Pisa, Livorno, Asti verso R6;
- Lucca, Como, Orta verso R8;

Resta da eseguire il supernetting dove possibile.
- R2, serve una sola rotta in quanto sono tutte contigue e della stessa misura. Includerà anche Lodi ma questa avrà una rotta più specifica;
- R4, non sono nè contigue nè della stessa misura quindi usiamo rotte specifiche per ogni LAN;
- R6, possiamo usare una la supernet minima che le racchiude tutte a partire dalla prima, in quanto c'è una rotta più specifica per ogni LAN indesiderata;
- R8, usiamo una rotta specifica per ognuna , per lo stesso motivo di R4.

## Routing di R2,4,6,8
I router posizionati in angolo hanno 5 interfacce: una verso R1, due verso LAN distinte, una verso il router successivo in senso orario, una verso il router precendente.
Il traffico verso le LAN cittadine viene gestito senza bisogno di rotte.

Indirizziamo verso il router successivo tutto il traffico diretto all'interno della sottorette usando la maschera /16, in quanto la direzione è obbligata.

Usiamo la rotta di default per simulare il traffico in uscita dalla rete che verrà instradato verso R1. Anche la destinazione ISP va instradata verso R1.

## Routind di R3,5,7,9
I router posizionati sui lati hanno 3 interfacce: una verso il router precedente, una verso il router successivo ed una verso la LAN cittadina.
Il traffico verso la LAN cittadina viene gestito senza bisogno di rotte.

Usiamo solo la rotta default verso il router successivo in quanto la direzione è obbligata.

