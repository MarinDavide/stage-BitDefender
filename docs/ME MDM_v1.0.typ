#import "template/generale.typ": *
#docStyle[
#documentTitle[Manage Engine MDM]

#set page(numbering: "1")
#versionTable(content:(
  [1.0],
  [12/08/2025],
  [Davide Marin],
  [Modifiche al documento e approvazione per versione 1.0],

  [0.1],
  [11/08/2025],
  [Davide Marin],
  [Creazione documento e inizio stesura]
))
#indiceDoc()

= Introduzione
Il MDM di Manage Engine è una soluzione per la gestione dei dispositivi mobili aziendali. Permette di configurare, monitorare e gestire dispositivi iOS e Android in modo centralizzato. Per entrambi i sistemi operativi, è possibile registrare i dispositivi come di proprietà dell'utente, ma con anche un profilo aziendale, oppure come "supervisionati", ovvero di proprietà dell'azienda e con un profilo aziendale completo.

== Differenze tra supervisionati e non supervisionati
I dispositivi supervisionati, rispetto a quelli che non lo sono, permettono un controllo più completo sul dispositivo e sulle sue funzionalità. Ad esempio quali applicazioni possono essere installate, quali restrizioni applicare al dispositivo (es. disabilitare fotocamera, Wi-Fi solo aziendale, ecc.), e dispongono di altre funzioni come la posizione in tempo reale. Questi dispositivi però necessitano di essere resettati per poter installare il profilo di supervisione.

I dispositivi non supervisionati, invece, possono essere registrati senza doverli resettare, ma hanno funzionalità limitate e non possono essere gestiti in modo completo. Una volta registrati come non supervisionati, gli utenti avranno le applicazioni "personali" senza alcun controllo, e quelle "aziendali" con i controlli applicati dal profilo aziendale (es. chrome aziendale con il filtro web). I controlli sul dispositivo stesso sono limitati (es. fotocamera, Wi-Fi, posizione ecc. non possono essere impostate).
#pagebreak()
= Registrazione dei dispositivi
== Dispositivi non supervisionati
Per registrare un dispositivo non supervisionato, è necessario seguire questi passaggi:
  - Andare nella sezione "Registrazione", premere "Registra dispositivo" e scegliere il tipo di dispositivo.
  - A questo punto ci sarà richiesto di assegnarlo ad un utente e a un gruppo, una volta fatto premere "Registra adesso".
  - A questo punto verrà generato un codice QR che dovrà essere scansionato dal dispositivo da registrare, questo installerà l'app ME MDM sul dispositivo.
  - A questo punto, il dispositivo sarà registrato e potrà essere gestito tramite il portale MDM, creando un profilo da assegnarli.

== Dispositivi supervisionati
Per registrare un dispositivo come supervisionato, è necessario innanzitutto resettare il dispositivo, e poi seguire i prossimi passaggi in base al sistema operativo desiderato.

=== Dispositivi iOS
Per prima cosa, creare un certificato APN, questo sarà necessario per gestire funzionalità die dispositivi Apple, per crearlo andare nella sezione "Certificato APN" e seguire le istruzioni per generarlo.

Successivamente, è possibile registrare il dispositivo in due modi differenti: con account ABM o tramite Apple Configurator, la differenza principale tra i due è che tramite ABM è possibile registrare i dispositivi "in blocco", mentre con Apple Configurator è possibile registrarne solo uno alla volta.

Per registrare tramite profilo ABM, seguira la guida nella sezione "Registrazione Apple (ABM/ASM) -> Registra dispositivi per l'azienda" e seguire le istruzioni fornite. Per registrare tramite Apple Configurator invece, seguire la guida nella sezione "Apple Configurator -> Passaggi di Configurazione".

=== Dispositivi Android
Per registrare un dispositivo android come supervisionato sono disponibili diverse modalità:
  - *Codice QR:* Una volta resettato il dispositivo, sarà sufficiente scansionare il codice QR generato nella sezione "Registrazione del codice QR" del portale MDM. In questo modo il profilo MDM verrà installato automaticamente, sarà sufficiente dare le conferme richieste dal dispositivo. In questo caso si possono solamente registrare i dispositivi uno alla volta.
  - *Zero touch:* Permette di registrare dispositivi in blocco, ma richiede un account Android for Work da essere collegato al portale "Zero touch". Per aprire il portale, andare nella sezione "Registrazione Zero Touch" e premere su "Avvia portale Zero Touch". 
  - *Samsung Knox:* Se si dispone di dispositivi samsung con Knox, è possibile registrarli in blocco utilizzando Samsung Knox. Per vedere passo passo come fare, andare nella sezione "Registrazione Samsung Knox" e premere su "Guarda la dimostrazione" (oppure premere #link("https://www.manageengine.com/eu/mobile-device-management/demo/samsung-knox-enrollment-with-mdm-video.html?mdmod")[qui])
  - *NFC:* È possibile registrare i dispositivi tramite NFC, per farlo è necessario disporre di un dispositivo amministratore sul quale installare l'app NFC ManageEngine, a questo punto sarà sufficiente avvicinare il dispositivo da registrare a quello amministratore e verrà installato il profilo MDM su quello da registrare.


#pagebreak()
= Gestione dispositivi
== Profili
I profili sono dei pacchetti di configurazione che possono essere assegnati ai dispositivi registrati. Permettono di impostare restrizioni e configurazioni specifiche per i dispositivi, come i criteri del passcode, quali funzionalità del dispositivo abilitare o disabilitare, configurazioni Wi-Fi, VPN, Mail, filtri web, e anche quali applicazioni rendere disponibili e come organizzare la schermata home del dispositivo, e altro ancora.

Per creare un profilo, andare nella sezione "Gestione -> Profili" e premere su "Crea profilo". A questo punto si potrà scegliere se creare un profilo per android o iOS (o anche altri sistemi operativi supportati), le impostazioni disponibili variano in base al sistema operativo scelto. Una volta creato il profilo, sarà possibile assegnarlo ai gruppi di dispositivi registrati.
#figure(
  image("img/ME_profili.png", width: 95%),
  caption: [Creazione profilo],
)

== Repository app
Qui è possibile aggiungere tutte le applicazioni che si desidera rendere disponibili sui dispositivi registrati. Una volta aggiunte alla lista delle applicazioni sarà possibile distribuirle ai dispositivi. Se il dispositivo è supervisionato, è possibile installare le app senza interazione utente, altrimenti, appariranno all'interno dell'app ME MDM e sarà richiesto di installarle.

È anche possibile personalizzare il layout di Play Store e App Store, per rendere disponibili solo le applicazioni desiderate, e anche creare dei cataloghi di applicazioni personalizzati per i dispositivi registrati. Nel caso del App Store, è necessario avere un account ABM da collegare a Manage Engine per poter personalizzarne il layout.
#figure(
  image("img/ME_layoutPS.png", width: 95%),
  caption: [Layout Play Store],
)

== Altre funzionalità
=== Gestione contenuti
È possibile condividere documenti e file con i dispositivi registrati, tramite app ME MDM. Per farlo, andare nella sezione "Gestione -> Gestione contenuti", premere "Aggiungi" e caricare il file desiderato. Una volta caricato tutti i dispositivi registrati potranno accedere al file entrando nell'app e premendo su "Content Catalog".

=== Annunci
È possibile inviare annunci ai dispositivi registrati. Per creare un annuncio, andare nella sezione "Gestione -> Annunci", premere "Crea annuncio", inserire il testo dell'annuncio e selezionare come verrà visualizzato dall'utente. Una volta creato, sarà possibile inviarlo a tutti i dispositivi registrati o a gruppi specifici, tramite pulsante "Distribuisci".

=== Controllo remoto
È possibile accedere in remoto ai dispositivi registrati, per fornire supporto o risolvere problemi. Per farlo, andare nella sezione "Gestione -> Controllo remoto", selezionare il dispositivo desiderato e premere su "Vista remota". Sarà necessario approvare la sessione sul dispositivo per potervi accedere (la vista remota non permette l'input di comandi, ma solo la visualizzazione schermo).

=== Geolocalizzazione
È possibile, per i dispositivi supervisionati, visualizzare la posizione in tempo reale di tutti i dispositivi. Per farlo impostare il profilo di geolocalizzazione nella sezione "Inventario -> Geolocalizzazione".
#figure(
  image("img/ME_geo1.png", width: 95%),
  caption: [Impostazioni geolocalizzazione],
)

A questo punto, sarà possibile vedere la posizione dei dispositivi supervisionati nella sezione "Inventario -> Dati posizione", essi appariranno come icone nella mappa (facendo un hover o un click con il mouse sull'icona saranno disponibili più info e opzioni).
#figure(
  image("img/ME_geo2.png", width: 95%),
  caption: [Visualizzazione posizione dispositivi],
)

=== Report
È possibile generare report sui dispositivi registrati, per avere una panoramica delle configurazioni, delle applicazioni installate, dello stato dei dispositivi e altro ancora. Per generare un report, andare nella sezione "Report", scegliere il tipo di report desiderato e premere su "Genera report". I report possono essere esportati in vari formati (PDF, CSV, XLSX).

#figure(
  image("img/ME_report.png", width: 95%),
  caption: [Report dispositivi],
)
]