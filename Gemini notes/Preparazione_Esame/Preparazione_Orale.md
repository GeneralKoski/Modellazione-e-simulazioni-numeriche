# Simulazione ed Assalto Finale: Le Domande All'Orale (Aggiornato)

Oltre alle logiche d'esplorazione viste prima, le seguenti sono le considerazioni più *insidiose* che faranno percepire un forte senso di padronanza del modello al professore. Tralasciando il codice, ti domanderà l'impatto sulla fisica di base!

## Domanda 1: "Spiegami la correttezza algoritmica di Hoshen-Kopelman: perché non controlli MAI i nodi a destra e in basso? Come fai a dire che funziona?"
**Risposta Ideale:** 
«L'algoritmo è strutturato integralmente per causalità (non guarda mai nel futuro geometrico). Dal momento che scansioniamo linearmente in Raster Scan riga dopo riga, le label `Up` e `Left` contengono l'intera informazione pregressa condensata della cronologia del software. Le unioni ramificate sfaldate "in basso" o "a destra" non passano inosservate: verranno banalmente processate e inglobate più avanti nel loop durante l'esplorazione successiva della matrice e, se per caso la cella si unirà a una macchia adiacente, l'istruzione parentale `Union-Find` la unirà magicamente retro-applicando il nuovo colore ai padri! Non c'è alcun bisogno di esplodere la memoria ram.»

## Domanda 2: "RACS: Mi hai estrapolato il RACS nella relazione. Soffermati un attimo: perché hai tolto proprio matematicamente dal pallottoliere l's_max? Cos'è quel 'vulcano' grafico?"
**Risposta Ideale:**
«Escludiamo l'$s_{max}$ appositamente, altrimenti il suo peso tendente a un valore massivo infinito nasconde la "Lotteria" secondaria delle masse. Proprio ad un passo logaritmico prima del 60% termodinamico ($P_c$), esistono ammassi giganti ma indipendenti e ramificati che si spingono ovunque, "lottrando" per unirsi. Poiché nella formula del RACS ho il quadrato delle dimensioni al numeratore ($s^2 \cdot n_s$), questa massa immensa che aspetta solo una goccia in pixel collassa, generando il picco esagerato! Ed è il preludio dell'effettiva transizione! Appena si innesca $P_c > 0.6$, si ricompattano in $s_{max}$ scomparendo dalla mia somma e il volume RACS frana magicamente giù di colpo e muore.»

## Domanda 3: "Grafico Sigmoide a L finito vs Teorema Infinito (Funzione di Heaviside) e Finite-Size Scaling"
**Risposta Ideale:**
«Per la teoria della Percolazione a Limite Termodinamico ($L \to \infty$), noi non vedremmo una curva dolce e morbida ("S"), ma la brusca e violenta \textit{Funzione di Heaviside} a gradino perpendicolare. Quella curva dolciastra che tracciamo deriva dall'effetto noto come Finite-size Scaling (Gli effetti di Bordo): Un muro hardware artificiale chiude il campo. La distanza entro cui le regioni colorate 'si riconoscono' (chiamata Lunghezza di Correlazione) devia la fisica, toccando in modo "fortunato e inquinato" le pareti d'una cellula che è troppo piccina. L'allargarsi in laboratorio smussa inevitabilmente il Salto Matematico vero ed assottiglia artificialmente il distacco limitandone l'approccio.»

## Domanda 4: "Autocorrelazione o no per i campionamenti?"
**Risposta Ideale:**
«A differenza dei grafici di *Birth-Death Code Process* (O Code del Postino) in cui mi tocca avvalermi dei teoremi del \textit{Tempo Esteso Autocorrelato} integrato per compensare l'errore legato alla forte dipendenza consecutiva di memoria da una transazione all'altra, in HK ho estratto test random ad ogni loop Monte-Carlo indipendente. Il seme crittografico impone matrici scollegate, consentendomi in pace di mostrare le Standard Errorbar senza inflazione! Lo scarto del prof. scema puristicamente usando la pura teoria d'insieme asintotico Standard $\frac{s}{\sqrt{N}}$.»

## Domanda 5: "Cosa succede in pratica e al tuo grafico se estrapolo in Reticolo di percolazione Tridimensionale 3D?"
**Risposta Ideale:**
«La curva frana a sinistra della griglia orizzontale. Poiché ciascuna coordinata e "Atomo colorato", per fusi cardinali, possiede fino a 6 vicini invece di 4 (Avanti-Dietro), il numero coordinato spinge ad un'unificazione esponenziale e quasi insperata massiva immensa. La Soglia di Percolazione (o punto infimo in cui schizza il Mega Cluster Orizzontale a Verticale) slitterà ferocemente a livelli molto più in basso di densità attese, attestandosi in ordine d'impatto vicino al $31\%$ rispetto al vecchio $\sim 60\%$.»
