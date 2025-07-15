#import "template/generale.typ": *
#set heading(numbering: "1.")
#set text(
  font: "Cambria",
  size: 12pt
)
#show heading: set text(navy)
#show link: underline

#align(center)[#documentTitle(content: ("Deploy - How to",))]
#pagebreak()

#versionTable(content:(
  [0.3],
  [14/07/2025],
  [Davide Marin],
  [Aggiunto e iniziato a redigere capitolo "Guida alla creazione delle politiche di protezione"],

  [0.2],
  [27/06/2025],
  [Davide Marin],
  [Stesura sezioni "Installare Security Server" e "Guida all'integrazione di Active Directory"],

  [0.1],
  [26/06/2025],
  [Davide Marin],
  [Creazione documento e inizio stesura]
))
#pagebreak()
#outline(
  title: [Indice],
  depth: 3
)
#pagebreak()
#outline(
  target: figure,
  title: [Lista delle immagini],
)
#pagebreak()
= Guida al deploy di GravityZone
Questa guida ha lo scopo di essere più diretta e semplice possibile, per permettere un'installazione semplice e veloce di GravityZone.
La guida ufficiale e completa è invece disponibile #link("https://www.bitdefender.com/business/support/en/77209-77397-installation.html")[*qui*].

== Accedere a GravityZone Control Center
Questa è la parte più semplice, ma fondamentale. Collegarsi alla pagina di login di GravityZone, e inserire le credenziali relative al proprio account, impostare il 2FA o SSO e continuare. 

A questo punto ci verrà richiesto di creare almeno un pacchetto di installazione per i nostri agent che dovremmo installare sugli endpoint.

== Installare Security Server (solo per endpoint con poche risorse)
Security server è necessario da essere installato su uno o più host, in base a quante macchine si devono gestire. L'host con security server installato centralizza la maggior parte delle attività anti-malware, e si comporta come un server per scansionare le macchine.

Innanzitutto, scaricare il pacchetto di installazione di Security Server di default (disponibile in Network -> Installation Packages), poi, installarlo sul endpoint che si vuole utilizzare come Security Server.

Successivamente è richiesto di configurare il Security Server si può fare tramite interfaccia locale, guida dettagliata disponibile #link("https://www.bitdefender.com/business/support/en/77209-215480-install-security-server-through-control-center.html#UUID-8f4072e1-37ed-4156-de58-85ef0d7d9aec_sidebar-idm4631416721104033093504368548_body")[*qui*], oppure tramite "sva-setup command", con guida dettagliata disponibile #link("https://www.bitdefender.com/business/support/en/77209-215480-install-security-server-through-control-center.html#UUID-8f4072e1-37ed-4156-de58-85ef0d7d9aec_sidebar-idm4631417086515233093426156546_body")[*qui*]


== Installare gli agenti

Per garantire la sicurezza degli endpoint (fisici e virtuali), è necessario installare l'agente di sicurezza su ciascun dispositivo. GravityZone offre diversi metodi per l'installazione degli agenti:
  - *Installazione locale*
  - *Installazione da remoto*: modalità in cui mi concentrerò in questa guida.

È importante che al primo endpoint sul quale andiamo ad installare l'agente venga assegnato il ruolo di Relay, questo per poter installare da remoto gli agenti sugli altri endpoint.
Inoltre, l'endpoint che ha il ruolo di Relay deve essere sempre acceso e connesso alla rete per permettere agli altri endpoint di comunicare con il Control Center.

Una volta installato l'agente con ruolo Relay, sarà possibile, tramite la finestra all'interno della sezione "Network", installare gli agenti sugli altri endpoint da remoto. Per farlo, bisogna prima creare un pacchetto di installazione, operazione possibile nella finestra che si apre selezionando  "Installation packages" nel menu a sinistra.

Sulla finestra che si apre, cliccare su "Create", compilare i campi e prestare attenzione a selezionare tutti i moduli che si vogliono utilizzare sugli endpoint (è comunque possibile modificare i moduli in seguito, per ogni endpoint), e salvare.

Una volta creato il pacchetto, andare nella pagina "Network", selezionare tutti gli endpoint sui quali si vuole installare l'agente e cliccare "Action" e poi "install agent". Nella finestra che si apre, bisogna inserire le credenziali di amministratore dell'endpoint (se si ha selezionato un gruppo di endpoint sotto ad un DC, inserire le credenziali del domain administrator), selezionare il Relay a cui fare "affidamento" ed infine il pacchetto di installazione desiderato.
Questo installerà l'agente su tutti gli endpoint selezionati. 

== Integrazione di Active Directory
Per integrare Active Directory con GravityZone, è sufficiente accedere a GravityZone Control Center, andare nella sezione "Network" e selezionare l'endpoint che si vuole utilizzare come integratore di Active Directory. Una volta selezionato, cliccare su "Action" e poi "Set as Active Directory Integrator".

Ora GravityZone si sincronizzerà con Active Directory ogni ora.

Per indicazioni aggiuntive e troubleshooting, è possibile consultare la guida ufficiale #link("https://www.bitdefender.com/business/support/en/77211-158550-microsoft-active-directory.html")[*qui*].


#pagebreak()
= Guida alla creazione delle politiche di protezione
Il primo passo, è andare nella sezione "Policies" dal menu a sinistra e cliccare su "Add".
#figure(
  image("img/add_policy.png", width: 75%),
  caption: [Aggiungi nuova politica di protezione],
)

Dalla finestra che si apre, è possibile definire nello specifico la policy, esploriamo le varie sezioni, che si suddividono in due gruppi principali: "General" e "Protection & Monitoring".

== General
Sotto a "General" è possibile definire le impostazioni relative alla policy e agli agenti.

=== Policy
Nella sezione "policy" è possibile definire le informazioni base della policy.

  - *Details:* Qui è possibile definire il nome della politica e se essa è collaborativa o meno. È inoltre possibile inserire i contatti del supporto tecnico visualizzati dagli utenti sui loro endpoint, che di base sono quelli del supporto ufficiale di Bitdefender.
  - *Inheritance Rules:* In questa pagina è possibile scegliere se "ereditare" la configurazione di un determinato modulo da un'altra policy. Attenzione, scegliendo di ereditare le regole da un'altra policy, si andrà a creare "un puntatore" alla policy da cui si ereditano le regole, e non una copia delle regole; modificando la policy da cui si ereditano le regole quindi, le modifiche verranno applicate anche a quella corrente.
#figure(
  image("img/inheritance.png", width: 95%),
  caption: [Aggiungi ereditarietà di un modulo],
)
#bestPractices[
==== Best Practices
Per la configurazione della voce "Policy", si consiglia di non aggiungere regole di ereditarietà, a meno che non si sia sicuri che le possibili modifiche apportate in futuro al modulo della policy "madre" vadano bene anche per la policy corrente; in tutti gli altri casi, è consigliato clonare la policy madre per poter lavorare sulle due politiche indipendentemente.
]

=== Agent
Nella sezione "Agent" è possibile definire le impostazioni relative agli agenti che utilizzeranno questa policy.

  - *Notifications:* In questa pagina si possono scegliere quali notifiche vedranno gli utenti sui loro endpoint; è possibile scegliere sia la tipologia di notifica, sia per quali eventi mostrarle.
  - *Settings:* In questa pagina è possibile definire alcune impostazioni riguardanti l'installazione e i permessi dell'agente. È possibile infatti inserire impostare una password per limitare la disinstallazione dell'agente, impostare il server di proxy se presente, e rendere o meno l'agente un "Power User". Il Power User è un utente che, tramite console, può gestire le proprie impostazioni della policy.
#figure(
  image("img/agent_settings.png", width: 85%),
  caption: [Impostare il power user],
)
  - *Communication:* Qui è possibile impostare con quale endpoint con ruolo "Relay" comunicare, e impostare diverse priorità in caso ci fossero più Relay. Impostare la comunicazione con il relay aiuta ad alleggerire il carico di lavoro sugli endpoint, delegando la comunicazione con il Control Center al relay.
  - *Update:* In questa pagina è possibile definire le impostazioni relative agli aggiornamenti degli agenti, come ad esempio la frequenza di aggiornamento del prodotto e dei sistemi di sicurezza.
  - *Security Telemetry:* In caso si disponesse di un server SIEM (soluzione di gestione delle informazioni e degli eventi di sicurezza), è possibile configurare la comunicazione con quest'ultimo in questa pagina.
#bestPractices()[
==== Best Practices
Per quanto riguarda la sezione "Agent", si consiglia per i diversi punti:
  - *Notifications:* impostare solo di tipo "notification pop-up" (non richiedono input utente) e solo per gli eventi che interessano direttamente l'utente (es. blocco applicazione o dispositivo), lasciare invece il controllo degli incidenti malware al team di sicurezza tramite Control Center, per non allarmare inutilmente gli utenti in caso di falsi positivi.
  - *Settings:* impostare la password di disinstallazione. A meno di casi particolari, non impostare l'agente come Power User.
  - *Communication:* impostare tutti i Relay come endpoint di comunicazione, assegnandogli la stessa priorità, in modo da far scegliere a Bitdefender quale Relay utilizzare in base alla disponibilità.
  - *Update:* lasciare le impostazioni di default.

]
=== Relay




== Protection & Monitoring
In questa sezione viene definita la politica vera e propria, che è composta da diversi moduli:
=== Antimalware 
Il modulo antimalware è molto completo, e diviso in diverse sezioni:
  - *On-Access:* In questa sezione è definito il livello di aggressività della scansione che avviene al momento dell'accesso ai file. 
  - *On-Execute:* In questa sezione è definito il livello di aggressività della scansione che avviene al momento dell'esecuzione dei file eseguibili. Inoltre è possibile attivare o disattivare alcuni tipi di controlli, come quello per gli attacchi fileless o ransomware.
  - *On-Demand:* Qui è possibile associare alla policy una regola di scansione, per vedere come crearne una fare riferimento al paragrafo "#link(<maintenanceWindow>)[Creazione Maintenance Windows]". In questa schermata inoltre, premendo su "Edit" all'interno del paragrafo "Contextual Scan", si possono personalizzare le impostazioni di scansione per le cartelle locali e quelle di dispositivi esterni. 
  #figure(
    image("img/scan_settings.png", width: 95%),
    caption: [Impostazioni di scansione],
  )
  - *Anti Tampering:* Qui è possibile attivare o disattivare i controlli anti-tampering, in particolare sui driver sensibili e sulle call-back evasion.
  - *Hyper Detect:* In questa pagina è possibile attivare e configurare per quali minacce utilizzare Hyper Detect, 
  un sistema di analisi di Bitdefender basato su machine learning.
  - *Advanced Anti-exploit:* Qui si possono gestire i controlli su diversi tipi di exploit, 
  - *Security Servers*:
  - *Settings:*
  - *Exclusions:*
#bestPractices()[
==== Best Practices
Per quanto riguarda il modulo antimalware, il consiglio è quello di attivare tutti i controlli disponibili (di default dovrebbero tutti essere attivi tranne la mitigazione ransomware all'interno di "On-Execute"). Per quanto riguarda lo scan On-Demand, prima di assegnare una window alla policy è necessario crearne una, per farlo, fare riferimento al paragrafo "#link(<maintenanceWindow>)[Creazione Maintenance Windows]".

]
=== Sandbox Analyzer
Il sandbox analyzer permette di analizzare i file sospetti in un ambiente sicuro, attivando la funzione, verranno inviati automaticamente al sandbox i file individuati. 
#bestPractices()[
==== Best Practices
Si consiglia di attivare la funzione, mantenendo però la "analysis mode" su "Monitoring" e la default action "report only", in questo modo non verranno mai bloccati file senza motivazioni certe.
]

=== Firewall   


=== Network Protection
=== Patch Management
=== Device Control
=== Incident Sensori
=== Risk Management
=== Blocklist
=== Live Search









#pagebreak()
= Guida alla gestione dei tag
#pagebreak()
= Guida al patch management
#pagebreak()
= Altre funzionalità
== Creazione Maintenance Windows <maintenanceWindow>
È possibile creare una maintenance window nella sezione "Policies -> Configuration Profiles -> Maintenance Windows" del menu a sinistra.
Nella schermata che si apre premere "Add Window". A questo punto sarà possibile decidere se solo scansionare o anche applicare le patch trovate. Per entrambe le operazioni sono disponibili diverse impostazioni.

#figure(
  image("img/maintenance_window_1.png", width: 95%),
  caption: [Maintenance Window],
)
#bestPractices()[
=== Best Practices
Si consiglia di attivare sia la scansione sia l'applicazione delle patch, e di spuntare sia "Security" che "Non-security". Attivare anche la fallback schedule, che permette di ripristinare i prodotti alla versione precedente in caso di problemi in seguito all'applicazione patch.

Per quanto riguarda la ricorrenza, è consigliato effettuare la scansione abbastanza spesso, ad esempio una volta ogni 2 giorni e in orari in cui le macchine sono accese (in ogni caso lasciare spuntata l'opzione "if missed run ASAP").

Se si è impostato un endpoint come server di cache per le patch qui è possibile assegnarlo alla window, in questo modo le patch saranno scaricate dal server di patch e non dal sito del vendor.
#figure(
  image("img/maintenance_window_2.png", width: 95%),
  caption: [Patch Caching Server],
)
]

== Creazione liste di esclusioni <listeEsclusioni>
