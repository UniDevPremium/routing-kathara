
# Compito per il Gruppo 42

Questo homework si compone di 5 esercizi.
Per la consegna, stilate un report in formato PDF che includa la risoluzione degli esercizi, le relative spiegazioni e gli allegati richiesti.
Includete screenshot/schemi/tabelle per supportare le vostre risposte.
Quando richiesto, insieme al report dovrete consegnare anche i file del laboratorio katharà.

Gli esercizi 3-4-5 richiedono di modificare la topologia di rete,
quindi è necessario consegnare i loro file di configurazione aggiornati in cartelle separate. 
Questi esercizi sono indipendenti tra di loro.
Tutti partono dalla stessa configurazione, quella che avete ottenuto alla fine dell'esercizio 2.

# Esercizio 1: Subnetting - 9 punti
Ti è stato assegnato il blocco di classe B 130.63.0.0/16.
Crea subnet contigue per i seguenti host nelle città:
Roma (7987 host),
Pavia (6911 host),
Fiuggi (6024 host),
Lodi (4725 host),
Pisa (3590 host),
Lucca (2956 host),
Livorno (1834 host),
Gela (1486 host),
Como (940 host),
Asti (708 host),
Imola (493 host),
Orta (89 host).
Assicurati di minimizzare lo spreco di indirizzi IP. 

Spiega il tuo ragionamento e riporta le subnet in una tabella con le colonne:
[ Città | #hosts | #indirizzi IP nel blocco | maschera | primo - ultimo indirizzo host | indirizzo di rete | indirizzo di broadcast ]


Questa è la tabella dei collegamenti p2p tra i router, il primo indirizzo IP utilizzabile di ogni collegamento è assegnato al router con il numero più basso.:
P2P	       Indirizzi IP
R1-R2	130.63.255.204/30
R1-R4	130.63.255.208/30
R1-R6	130.63.255.212/30
R1-R8	130.63.255.216/30
R2-R3	130.63.255.220/30
R2-R9	130.63.255.224/30
R3-R4	130.63.255.228/30
R4-R5	130.63.255.232/30
R5-R6	130.63.255.236/30
R6-R7	130.63.255.240/30
R7-R8	130.63.255.244/30
R8-R9	130.63.255.248/30
R1-ISP	130.63.255.252/30


# Esercizio 2: Routing Statico - 9 punti

Crea un laboratorio katharà ricreando la configurazione di router e città con le subnet create nell'esercizio 1. 
Per ogni città crea un singolo host, rappresentante la LAN locale, con lo stesso nome della città.
Associa a questo host il secondo indirizzo IP utilizzabile della subnet corrispondente (il primo è per il router).
Per convenzione le interfacce dei router vengono numerate progressivamente con la notazione "ethX",
iniziando da eth0 sulla porta allineata verticalmente in alto (ore 12).
Le interfacce successive vengono numerate in ordine procedendo in senso orario. 
Ad esempio:
    - Interfaccia a ore 12 → eth0
    - Interfaccia a ore 3 → eth1
    - Interfaccia a ore 6 → eth2
    - Interfaccia a ore 9 → eth3.


Configura le rotte statiche per abilitare la connettività end-to-end tra tutte le città e l'ISP.
    - Il traffico tra le città e i router di bordo deve seguire un percorso in senso orario lungo l'anello esterno. 
    Ogni router deve configurare rotte statiche che rispettino questa direzione.

    - Per il traffico diretto a R1 o fuori dalla subnet (es. verso "internet"), il primo router lungo il percorso deve instradarlo verso R1, che avrà a sua volta una rotta configurata verso l'ISP.
    Mostrate come il traffico diretto verso nodi esterni alla rete viene instradato correttamente attraverso l'ISP, anche in assenza di risposta. 

La tabella di routing in R1 deve ridurre al minimo il numero di hop del traffico ISP -> città, ricordando che il traffico sui router ai bordi segue una direzione. 
Usa il minor numero di rotte possibili per instradare il traffico nella tabella di routing di R1 
    - quando possibile usa il supernetting e spiega il ragionamento.
    - se non è possibile spiega perché.

Spiega il tuo ragionamento e riporta graficamente, sulla mappa della rete:
    - le subnet allocate per ogni città e link tra i router
    - le interfacce dei nodi e gli indirizzi associati ad ognuna

Per ogni router, riporta le rotte statiche configurate in formato tabellare con colonne: 
[ Router | Interfaccia & Indirizzo | ---- | #Static route | Subnet Destinazione | Gateway | Interfaccia ]

es.: 
Router,Interfaces & Addresses,,Static Route #,Destination,Gateway,Interface
r1,Eth0: 130.63.255.209/30,,1,130.63.0.0/18,130.63.255.206,eth4
,Eth1: 130.63.255.253/30,,2,130.63.160.0/19,130.63.255.206,eth4
,Eth2: 130.63.255.213/30,,3,130.63.244.0/22,130.63.255.206,eth4
,Eth3: 130.63.255.217/30,,4,130.63.128.0/19,130.63.255.210,eth0
,Eth4: 130.63.255.205/30,,5,130.63.240.0/22,130.63.255.210,eth0
,,,,6,130.63.232.0/21,130.63.255.210,eth0
,,,,7,130.63.208.0/20,130.63.255.214,eth2
,,,,8,130.63.224.0/21,130.63.255.214,eth2
,,,,9,130.63.96.0/19,130.63.255.214,eth2
,,,,10,130.63.192.0/20,130.63.255.218,eth3
,,,,11,130.63.64.0/19,130.63.255.218,eth3
,,,,12,130.63.248.0/25,130.63.255.218,eth3
,,,,13,130.63.255.254/32,130.63.255.205,eth2
,,,,14,default,130.63.255.254,eth1
(copialo in un file .csv per visualizzare la tabella in modo ordinato)

Consegna la cartella del laboratorio katharà rinominata "esercizio2".

#### Gli esercizi successivi sono indipendenti tra di loro, inizia sempre con la rete configurata come alla fine del secondo esercizio. #####

# Esercizio 3: Connettività Internet - 4 punti
Il router R2 è isolato per un guasto ai link con i router adiacenti. 
Spiegare e mostrare nel report come l'ISP può individuare esattamente quale router è guasto, usa screen dei terminali per arricchire la spiegazione.
Per riportare connettività internet a Roma e Pavia, l'ISP ha creato una nuova connessione diretta con R2 ed il router R1.
Il traffico deve continuare ad essere instradato in senso orario finché non si raggiunge R1. 
Modifica il laboratorio di conseguenza e aggiungi le rotte necessarie per ripristinare la piena connettività di rete tra tutte le città. 

Spiega il tuo ragionamento e riporta graficamente, sulla nuova mappa della rete:
    - le modifiche ai link tra i router dovuti al guasto e le nuove connessioni instaurate, con le nuove interfacce e gli indirizzi associati ad ognuna
    - le nuova tabella di routing per ogni router e nodo coinvolto in formato tabellare con colonne: 
    [ Router | Interfaccia & Indirizzo | ---- | #Static route | Subnet Destinazione | Gateway | Interfaccia ]

Consegna la cartella del laboratorio katharà rinominata "esercizio3".


# Esercizio 4: Traffico Anomalo - 4 punti
Un controllo di rete ha mostrato un server a Orta che sta ricevendo traffico anomalo, bisogna analizzarlo. 
Seleziona un indirizzo IP (da adesso <SERVER_IP>) al centro del blocco assegnato a Orta, che identifica questo server. 

Crea questo nuovo nodo all'interno della rete e configura il routing in modo che il traffico diretto verso <SERVER_IP> venga instradato attraverso R1, il quale avrà una nuova connessione diretta con il server.

Utilizzate wireshark e/o altri strumenti per mostrare che solo il traffico diretto verso <SERVER_IP> viene dirottato attraverso R1.
Spiega e mostra come hai configurato il routing, screen dell'analisi del traffico e come viene sfruttata la regola del Longest Prefix Matching.

Consegna la cartella del laboratorio katharà rinominata "esercizio4".

# Esercizio 5: ARP e Ping - 4 punti
Pulite tutte le tabelle arp di router e hosts. Esegui ping tra le seguenti città: Lodi -> Roma, Lucca -> Livorno, Gela -> Pavia.
Documenta con screenshot dei terminali quali nodi vengono utilizzati per la comunicazione, illustra come cambiano le tabelle ARP dopo ogni ping. Includi screenshot o tabelle per supportare le tue osservazioni.

Deadline della consegna: Sabato 21/12/2024 alle 18:00. 
Il tutto deve essere caricato come cartella compressa ( .zip / .7z /.tar.gz ) su Moodle alla stessa voce in cui avete trovato il link drive. 
Per evitare inconvenienti, inviate anche una mail a pierluigi.locatelli@uniroma1.it con oggetto "Consegna Homework Gruppo 42 - Canale X" e allegato tutto il materiale richiesto, insieme ai cognomi e le matricole dei partecipanti.