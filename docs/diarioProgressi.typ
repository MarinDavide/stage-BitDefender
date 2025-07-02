#import "template/generale.typ": *
#set heading(numbering: "1.")
#set text(
  font: "Cambria",
  size: 12pt
)
#show heading: set text(navy)
#show link: underline

#align(center)[#documentTitle(content: ("Diario dei progressi",))]
#pagebreak()

#versionTable(content:(
  [0.6],
  [02/07],
  [Davide Marin],
  [Aggiunta sezione "Mercoledì 02/07"],

  [0.5],
  [01/07],
  [Davide Marin],
  [Aggiunte sezioni "Lunedì 30/06" e "Martedì 01/07"],
  
  [0.4],
  [27/06],
  [Davide Marin],
  [Aggiunta sezione "Venerdì 27/06"],

  [0.3],
  [26/06],
  [Davide Marin],
  [Aggiunta sezione "Giovedì 26/06"],

  [0.2],
  [25/06],
  [Davide Marin],
  [Aggiunta sezione "Mercoledì 25/06"],

  [0.1],
  [24/06],
  [Davide Marin],
  [Creazione documento, inserimento riassunto e aggiornamento odierno]
))

#pagebreak()
= Prima settimana (19-27/06)
== Martedì 24/06
=== Riassunto giorni passati
Da giovedì 19 a lunedì 23 ho effettuato uno studio il più approfondito possibile, ma prettamente teorico, sullo strumento antivirus Bitdefender GravityZone.
Ho steso un file di appunti personali su ciò che ho visto sulle pagine di documentazione di Bitdefender a mano a mano che approfondivo le diverse funzionalità del portale.

Nel frattempo, ho studiato e approfondito personali lacune nelle informazioni che leggevo, come le tecnologie di prevenzione, protezione e mitigazione da parte dell'antivirus, e quelle relative alle modalità di attacco utilizzate comunemente.

Ieri, lunedì 23, ho inoltre iniziato ad applicare alcune politiche alla mia macchina, per vedere se riuscissi a gestirne il funzionamento; purtroppo ho avuto difficoltà e i miei tentativi di applicare regole, in particolare limitazioni web e di applicazioni, non hanno avuto successo.

=== Cose fatte oggi
Oggi sono riuscito a trovare e risolvere i problemi riscontrati ieri. Per la parte web, si trattava di selezionare l'opzione di scannerizzare anche il traffico criptato, in questo modo si rende possibile all'antivirus di effettuare il blocco anche dei siti con protocollo HTTPS. Per quanto riguarda il blocco applicazioni, invece, mi sono assicurato che il percorso segnalato fosse privo di caratteri “speciali”.

Ho iniziato anche una parte di testing per controllare il giusto funzionamento dell'anti-malware: ho simulato “attacchi” innocui sia tramite file sia fileless, i primi tramite la stringa nota fornita da EICAR:

#align(center)[* X5O!P%\@AP\[4\PZX54(P^)7CC)7}\$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!\$H+H\* *]

i secondi, tramite comando PowerShell innocuo, ma che simula il possibile comportamento di un attacco fileless:

#align(center)[*powershell -nop -w hidden -c " IEX ' Write Output TestFilelessAttack ' "*]

In questo modo, ho testato (e verificato) il giusto comportamento di:
  -   *Anti-malware On-Access (file)*
      Il file è stato individuato ed eliminato non appena l'ho creato e salvato; ho provato inoltre a disattivare il controllo per crearlo, riattivare il controllo e poi aprire il file e, correttamente, all'apertura il file viene bloccato ed eliminato.
  -   *Anti-malware On-Execute Fileless Attack Protection (fileless)*
      Il comando è stato bloccato con relativo messaggio di errore.
  -   *Web Protection Web Traffic Scan (file)*
      Scaricando il file di test (direttamente dal sito EICAR) Bitdefender individua file e .zip contente il file di test, e ne blocca il download.
tutti gli eventi sono stati inoltre registrati sul portale di GravityZone.

Ho anche testato l'impostazione di altre funzionalità di GravityZone:
  -   Anti-malware “On-Demand”, lanciando una “full scan” programmata del mio pc.
  -   Blocco dispositivi, bloccando tutte le USB tranne una aggiungendola come esclusione.

=== Difficoltà riscontrate
  - Sembra non essere possibile aggiungere agli endpoint il modulo “Integrity     Monitoring”, in quanto, a differenza di come mostrato nella guida non è presente tra le opzioni nella configurazione dell'agent. Inoltre, anche nella pagina dedicata, non è possibile creare regole: la documentazione parla di un pulsante “Action” che però non è presente nel portale.

  - Ho provato a testare la funzionalità di “Ransomware activity” che dovrebbe permettere di ripristinare i file affetti da attacchi ransomware dall'interfaccia di GravityZone. Purtroppo, provando ad eseguire un semplice script che convertiva un file di testo “cavia” in B64, non ho attirato l'attenzione da parte di Bitdefender, e non ho quindi potuto verificarne la funzionalità.


== Mercoledì 25/06
=== Cose fatte oggi
Oggi ho studiato anche la parte relativa alla sicurezza mobile, anche se non ho potuto testarla per (credo) mancanza di dispositivi registrati.

Ho testato la funzionalità del Sandbox Analyzer: il sistema permette di inviare al Sandbox qualsiasi file se si avesse il dubbio che possa essere pericoloso, in pochi minuti nella pagina dedicata si riceverà un resoconto della “detonazione” del file, con relativi livelli di severità e comportamenti.

Ho testato la configurazione di ulteriori politiche, arricchendo ciò che era stato fatto nei giorni precedenti.

Ho inoltre configurato una repo GitHub per garantire il versioning della documentazione che sto redando, la pagina della documentazione aggiornata è disponibile al link:

#align(center)[* https://marindavide.github.io/stage-Bitdefender/ *]

=== Difficoltà riscontrate
Dubbi sulla utilità di alcuni moduli.
Incongruenze tra la documentazione e il portale GravityZone, che rallentano il lavoro durante la messa in pratica di alcune operazioni.


== Giovedì 26/06
=== Cose fatte oggi

Ho iniziato a studiare la parte di deply del prodotto, seguendo la "tabella di marcia" del piano di progetto e iniziato a redigere la documentazione relativa.

Ho testato la creazione di pacchetti di installazione per gli agenti, e la loro installazione su un endpoint remoto, che hano avuto successo.

Ho iniziato a studiare la parte di integrazione di Active Directory, e la sua configurazione.

=== Difficoltà riscontrate
Incongruenze tra la documentazione e il portale GravityZone, che rallentano il lavoro durante la messa in pratica di alcune operazioni.

== Venerdì 27/06
=== Cose fatte oggi
Ho creato una policy personalizzata che comprenda una whitelist per i domini e gli IP necessari per il funzionamneto di PhishBrain, e applicata ad altri endpoint aziendali.

Ho continuato a redigere la documentazione relativa al deploy del prodotto.

Ho approfondito la parte di sicurezza per le mail, in particolare come poter gestire le soluzioni che utilizzano Microsoft 365 in cloud.

Ho trovato e provato come impostare il PowerUser su un endpoint:
  - Inserire nel pacchetto di installazione il modulo "PowerUser"
  - Selezionare, all'interno della Policy che si applicherà all'endpoint, la spunta "Power User" ed inserire la password desiderata.
  - Applicare la policy all'endpoint.
  - Sull'endpoint, è possibile accedere alla CLI del Power User selezionando l'opzione omonima dopo aver cliccato con il tasto destro sull'icona di Bitdefender (che si trova in "icone nascoste" nella barra delle applicazioni).
  - È inoltre possibile accedere alla GUI del Power User, per farlo bisogna aprire il file `EPPowerConsole.exe` che si trova in:
  #align(center)[`c:\Program Files\Bitdefender\Endpoint Security`]

Inoltre, ho preso failiarità sia con la CLI del Power User, sia con quella dell'utente normale, che potrebbe tornare utile in caso di macchine virtuali senza GUI. Per futuro utilizzo, i comandi disponibili per l'utente normale sono disponibili #link("https://www.bitdefender.com/business/support/en/77209-36849-using-the-command-line-interface.html")[*qui*]; mentre quelli per il Power User sono disponibili #link("https://www.bitdefender.com/business/support/en/77209-87461-using-the-power-user-module.html#UUID-06cb7c53-22b7-4f4f-c6a8-941a976c25e6_UUID-61700b4c-3c62-012a-09e2-1a0975cdb90d")[*qui*].

=== Difficoltà riscontrate
Documentazione scarsa e poco chiara per quanto riguarda l'integrazione della sicurezza delle mail con Microsoft 365, inoltre sono incapacitato di testare la funzionalità perché l'azienda possiede già un servizio di sicurezza mail che andrebbe in conflitto con quello di Bitdefender.


= Seconda settimana (30/06-04/07)
== Lunedì 30/06
=== Cose fatte oggi
Oggi ho studiato la parte relativa ai security containers.
Inoltre, ho iniziato a vedere la parte di API e provato alcune chiamate tramire script in Python.

=== Difficoltà riscontrate
nessuna difficoltà particolare.


== Martedì 01/07
=== Cose fatte oggi
Oggi mi sono concentrato sulla parte di API, e di monitoraggio e metigiazione del rischio degli endpoint

=== Difficoltà riscontrate
La piattaforma non permette di visualizzare le modifiche effettuate, per la mitigazione dei rischi, in tempo reale, il che rende difficile avere un riscontro delle modifiche effettuate.


== Mercoledì 02/07
