#import "template/generale.typ": *
#set heading(numbering: "1.")
#set text(
  font: "Cambria",
  size: 12pt
)
#show heading: set text(navy)
#show link: underline

#align(center)[#emph(text(fill: blue,size: 45pt)[Deploy - How to])]
#pagebreak()

#versionTable(content:(
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

= Guida al deploy di GravityZone
Questa guida ha lo scopo di essere più diretta e semplice possibile, per permettere un'installazione semplice e veloce di GravityZone.
La guida ufficiale e completa è invece disponibile #link("https://www.bitdefender.com/business/support/en/77209-77397-installation.html")[*qui*].

== Accedere a GravityZone Control Center
Questa è la parte più semplice, ma fondamentale. Collegarsi alla pagina di login di GravityZone, e inserire le credenziali relative al proprio account, impostare il 2FA o SSO e continuare. 

A questo punto ci verrà richiesto di creare almeno un pacchetto di installazione per i nostri agent che dovremmo installare sugli endpoint.

#pagebreak()
== Installare Security Server (per ambienti con macchine virtuali)
Security server è necessario da essere installato su uno o più host, in base a quante macchine virtuali di devono gestire. L'host con security server installato centrallizza la maggior parte delle attività anti-malware, e si comporta come un server per scansionare le macchine virtuali.

Innanzitutto, scaricare il pacchetto di installazione di Secutity Server di default (disponibile in Networl -> Installation Packages), poi, installarlo sull'endpoint che si vuole utilizzare come Security Server.

Successivamente è richiesto di configurare il Security Server si può fare tramite interfaccia locale, guida dettagliata disponibile #link("https://www.bitdefender.com/business/support/en/77209-215480-install-security-server-through-control-center.html#UUID-8f4072e1-37ed-4156-de58-85ef0d7d9aec_sidebar-idm4631416721104033093504368548_body")[*qui*], oppure tramite "sva-setup command", con guida dettagliata disponibile #link("https://www.bitdefender.com/business/support/en/77209-215480-install-security-server-through-control-center.html#UUID-8f4072e1-37ed-4156-de58-85ef0d7d9aec_sidebar-idm4631417086515233093426156546_body")[*qui*]


#pagebreak()
== Installare gli agenti

Per garantire la sicurezza degli endpoint (fisici e virtuali), è necessario installare l'agente di sicurezza su ciascun dispositivo. GravityZone offre diversi metodi per l'installazione degli agenti:
  - *Installazione locale*
  - *Installazione da remoto*: modalità in cui mi concentrerò in questa guida.

È importante che al primo endpoint sul quale andiamo ad installare l'agente venga assegnato il ruolo di Relay, questo per poter installare da remoto gli agenti sugli altri endpoint.
Inoltre, l'endpoint che ha il ruolo di Relay deve essere sempre acceso e connesso alla rete per permettere agli altri endpoint di comunicare con il Control Center.

Una volta installato l'agente con ruolo Relay, sarà possibile, tramite la finestra all'interno della sezione "Network", installare gli agenti sugli altri endpoint da remoto. Per farlo, bisogna prima creare un pacchetto di installazione, operazione possibile nella finestra che si apre selezionando  "Installation packages" nel menu a sinistra.

Sulla finestra che si apre, cliccare su "Create", compilare i campi e prestare attenzione a selezionare tutti i moduli che si vogliono utilizzare sugli endpoint (è comunque possibile modificare i moduli in seguito, per ogni endpoint), e salvare.

Una volta creato il pacchetto, andare nella pagina "Network", selezionare tutti gli endpoint sui quali si vuole installare l'agente e cliccare "Action" e poi "install agent". Nella finestra che si apre, bisogna insrire le credenziali di amministratore dell'endpoint (se si ha selezionato un gruppo di endpoint sotto ad un DC, inserire le credenziali del domain administrator), selezionare il Relay a cui fare "affidamento" ed infine il pacchetto di installazione desiderato.
Questo installerà l'agente su tutti gli endpoint selezionati.


#pagebreak()
= Guida all'integrazione di Active Directory
Per integrare Active Directory con GravityZone, è sufficiente accedere a GravityZone Control Center, andare nella sezione "Network" e selezionare l'endpoint che si vuole utilizzare come integratore di Active Directory. Una volta selezionato, cliccare su "Action" e poi "Set as Active Directory Integrator".

Ora GravityZone si sincronizzerà con Active Directory ogni ora.

Per indicazioni aggiuntive e troubleshooting, è possibile consultare la guida ufficiale #link("https://www.bitdefender.com/business/support/en/77211-158550-microsoft-active-directory.html")[*qui*].
