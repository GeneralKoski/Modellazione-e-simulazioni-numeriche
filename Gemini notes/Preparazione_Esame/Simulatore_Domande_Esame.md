# Simulatore Domande d'Esame: Orale Garantito

Le tematiche di questo esame prendono l'avvio dalla Relazione ("Project Based") che discuterai. Questa lista serve per consolidare il testamento sulle sfumature e sulle curiosità teoriche, per evitare d'essere spiazzati nei casi limite esplorativi chiesti in aula.

### Sulla Maturazione Statistica:
1. **Domanda (L'Autocorrelazione):** "In un processo dinamico di Markov (come nel tracciamento iterato dei tempi di una Coda), perché applichiamo un algoritmo per calcolare l'errore differente dal semplice Std Error $(std(X)/\sqrt{N})$ e come influisce l'Autocorrelazione sulla stima della varianza di misurazione vera?"
2. **Domanda (Barre e Soglia Logistica):** "Giustifica perché all'aumentare di the N prove per simulare la convergenza asintotica della transizione a $\rho=1$ i grafici restituiscano errori più stringenti, e mostra matematicamente qual è la base concettuale che assicura questa riduzione".

### Sulla Percolazione Termodinamica & Grafica:
3. **Domanda (Limite di Taglia L):** "Cosa devi aspettarti nella forma e nella curvatura della Probabilità di Coda ($P_{perc}$) per un Reticolo teoricamente illimitato (e infinito) e che correlazione concettuale vi è con la funzione di graduino o Heaviside all'avvicinarci numericamente verso limite superiore? "
4. **Domanda (Significato Denominatori nel RACS):** "Se dovessi spiegare matematicamente a cosa ammonta il computo del 'Reduced Average Cluster Size' (RACS), da dove si discosta dalla mera dimensione di un Cluster randomico pesato e cosa causa concettualmente a bordo della *Soglia $p_c$*?"
5. **Bonus Curiosity (Evoluzione 3D):** "Mostrami idealizzandone il meccanismo, di quanto varierebbe numericamente la probabilità base soglia spostando lo scenario di implementazione della percolazione in un Reticolo 3D o con densità strutturale sfalsata". (Sarebbe maggiore e si percola molto prima!).

### Sulle Reversibilità (Ehrenfest) & Code (HK Analysis):
6. **Domanda (Differenze Stazionarietà):** "Nel momento dello studio e determinazione dell'equilibrio e del versore delle distribuzioni limitanti, potresti motivare per via topologica quando un sistema senza chiusura spaziale (come in una sala d'attesa infinita) smetta rigorosamente di poter ammettere limitare d'Autovettori costanti stazionari?"
7. **Domanda (I due Modelli Coda Varianti):** "Mostrami la differenza fra i tempi di attesa effettivi per utenti in Coda quando l'intervallo temporale tra due arrivi abbandona la Poissoniana diventando una logica costante temporalmente."
8. **Domanda (Correttezza Operazionale HK):** "A livello logaritmico-strutturale spiegami la validazione del tuo algoritmo HK presentata sulla relazione. Perché non hai necessità strutturale computativa (e come ne trai vantaggio pregevole in performance rispetto al flooding cluster) di guardare in avanti (Right, Bottom) pur determinandone categoricamente una Union-Find list corretta?"
