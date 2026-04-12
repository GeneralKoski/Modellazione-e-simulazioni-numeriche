# Ricettario delle Formule (Semplificato)

Questo file contiene le formule principali che devi conoscere per l'esame, spiegate in modo semplice.

---

## 1. Trasformare un numero a caso in un tempo (MATLAB)

Per simulare quando arrivano i clienti (tempi di arrivo) o quanto tempo ci mettono a essere serviti, usiamo questa formula. Trasforma un numero casuale tra 0 e 1 (`rand()`) in un tempo che segue la distribuzione **Esponenziale**:

$$ t_a = -\frac{1}{\lambda} \ln(\text{rand}()) $$

*(Dove $\lambda$ (_lambda_) è la frequenza con cui arrivano i clienti).*

---

## 2. Formule per le Code

- **Rapporto di Traffico ($\rho$):**
  $$ \rho = \lambda \cdot s $$
  *(Dove $\lambda$ è quanto spesso arrivano e $s$ è quanto tempo ci mette il servizio).*
  **Attenzione**: Se $\rho \ge 1$, arrivano clienti più velocemente di quanto riesci a servirli, quindi la coda cresce all'infinito.

- **Probabilità di avere 1 cliente in coda ($\Pi_1$):**
  $$ \Pi_1 = \frac{\Pi_0(1 - K_0)}{K_0} $$
  *(Dove $\Pi_0$ è la probabilità che la coda sia vuota e $K_0$ è la probabilità che non arrivi nessuno durante un servizio).*

- **Trovare media e varianza della coda:**
  In uno stato stabile (stazionario), usiamo queste uguaglianze per trovare i valori medi:
  - $\mathbb{E}(Q_n^2) = \mathbb{E}(Q_{n+1}^2)$ → serve per trovare la **media**.
  - $\mathbb{E}(Q_n^3) = \mathbb{E}(Q_{n+1}^3)$ → serve per trovare la **varianza**.

---

## 3. Formule per la Percolazione

- **Grandezza del cluster gigante ($P_1$):**
  Ci dice quanta parte della griglia è occupata dal cluster più grande:
  $$ P_1 = \frac{s_{max}}{L^2} $$
  *(Dove $s_{max}$ è il cluster più grande e $L^2$ è la grandezza totale della griglia).*

- **RACS (Taglia Media dei Cluster):**
  È la media della grandezza di tutti i cluster, **senza** contare quello più grande ($s_{max}$).
  $$ RACS = \frac{\sum_{s \neq s_{max}} s(s \cdot n_s)}{\sum_{s} (s \cdot n_s)} $$
  Vicino alla soglia di percolazione, questa formula "esplode" (il valore diventa altissimo), indicando che i cluster si stanno unendo.
