# Ricettario delle Formule

Questo file raggruppa tutti i principali output matematici che ti servono (e che dovrai saper dimostrare o usare in codice) all'esame.

## 1. Generazione di Variabili Casuali (Matlab)

Nei codici di simulazione (es. tempi esatti di arrivo o servizio), utilizziamo questa formula per forzare una densità uniforme nell'intervallo tra zero e uno (`rand()`) dentro la densità **Esponenziale** (inversa della funzione cumulativa):
$$ t_a = -\frac{1}{\lambda} \ln(\text{rand}()) $$
*(Dove $\lambda$ è il tasso d'intercorrenza/densità).\*

## 2. Equazioni per il "Modello di Coda"

- **Rapporto di stazionarietà/Traffico ($\rho$):**
  $$ \rho = \lambda \cdot s \quad (\text{Densità di arrivo} \times \text{Tempo medio servizio}) $$
  *Se $\rho \ge 1$ nella coda infinita, la distribuzione non converge (accumulo infinito).\*

- **Ricorsione della Distribuzione Stazionaria ($\Pi$):**
  Nel caso di tempi costanti e Poissoniani, risolvendo per righe:
  $$ \Pi_1 = \frac{\Pi_0(1 - K_0)}{K_0} $$
  dove $K_0$ è la probabilità d'arrivo di 0 clienti durante un tempo esatto di servizio.

- **Varianza e Momenti Formali dell'Evoluzione della coda:**
  Per valutare la varianza analitica si usa l'equazione di massa con le potenze.
  L'equazione base $Q_{n+1} = Q_n - H(Q_n) + X_{n+1}$ viene impiegata. In stato stazionario:
  $\mathbb{E}(Q_n^2) = \mathbb{E}(Q_{n+1}^2)$ (che permette di trovare la media)
  $\mathbb{E}(Q_n^3) = \mathbb{E}(Q_{n+1}^3)$ (che permette di trovare la varianza).

## 3. Elementi della Percolazione

Dato un reticolo infinito o finito (di dimensione $L^2$) in cui $s_{max}$ è la taglia massima prodotta da un cluster. Siano inoltre $s$ le diverse taglie registrate e $n_s$ la loro frequenza d'occorrenza.

- **Calcolo probabilità pesate (P1, P2, P3):**
  $$ P*1 = \frac{s*{max}}{L^2} $$

- **RACS (Reduced Average Cluster Size - Media Ridotta):**
  Taglia media dei cluster che non prenderà in considerazione il picco generato dal cluster massivo dominante a cavallo della soglia di fase.
  $$ RACS = \frac{\sum*{s \neq s*{max}} s(s \cdot n*s)}{\sum*{s} (s \cdot n_s)} $$
  L'esplosione di questa formula al denominatore mostra la transizione termodinamica della connettività.
