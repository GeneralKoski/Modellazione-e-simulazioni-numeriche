% Analisi_Soglia_RACS.m
% Macchina statistica ad alta precisione per l'indagine a tappeto:
% 1. Soglia di phase-transition (Sigmoide)
% 2. P1 (Frazione cluster dominante)
% 3. RACS (Il "Vulcano")
%
% Rispetta rigorosamente le raccomandazioni del Prof:
% Usa 'N' prove e fissa il calcolo con le 'errorbar'

clear; clc; close all;

%% == PANNELLO DI COMANDO ==
% CAMBIARE QUESTI DUE PARAMETRI A PIACERE PER L'ESAME
L = 100;              % Risoluzione griglia fisica (Default: 100x100)
N_proved = 1000;        % Ripetizioni di calcolo M-Carlo! (Per ora: veloce=20. Metti 200 prima di esportare le foto per la tesi)

% Concentriamo gli esperimenti sulla soglia (fra ~0.55 e ~0.65)
p_color = [0.1:0.1:0.4, 0.45:0.02:0.7, 0.75:0.05:0.9];
num_p = length(p_color);

%% Array Ricevitori (Media ed Errore)
perc_med = zeros(1, num_p); 
perc_err = zeros(1, num_p);

P1_med = zeros(1, num_p); 
P1_err = zeros(1, num_p);

racs_med = zeros(1, num_p); 
racs_err = zeros(1, num_p);

disp(['== ALGORITMO SOGLIE AVVIATO (Grid ' num2str(L) 'x' num2str(L) ', Prove=' num2str(N_proved) ') ==']);
tic;

%% MOTORE HK - ITERATIVO
for k = 1:num_p
    p = p_color(k);
    
    % Accumulatori locali del punto n-esimo
    val_perc = zeros(1, N_proved);
    val_P1   = zeros(1, N_proved);
    val_RACS = zeros(1, N_proved);
    
    for i = 1:N_proved
        res = HK(L, p); % Usa HK (così finiamo velocemente!)
        
        % Flag binario: Trovato Orizzontale O Verticale
        val_perc(i) = (res.percolazioneTB + res.percolazioneLR) > 0;
        
        if isempty(res.clusters)
             val_P1(i) = 0;
             val_RACS(i) = 0;
             continue;
        end
        
        tutti_i_cluster = res.clusters; % la dimensione estratta
        s_mas = max(tutti_i_cluster);
        
        % Calcolo P1 (rapporto sull'intero lattice L^2)
        val_P1(i) = s_mas / (L^2);
        
        % Calcolo RACS (escludi l'smax)
        dim_denom = sum(tutti_i_cluster); % Pari ai siti '1' totali
        if length(tutti_i_cluster) <= 1
            val_RACS(i) = 0;
        else
            % Togliamo UNA singola occorrenza del mega-cluster
            s_rimanenti = tutti_i_cluster;
            idx_smax = find(s_rimanenti == s_mas, 1);
            s_rimanenti(idx_smax) = []; 
            
            % Il numeratore (vedi teoria) espande la s pesata s*s
            val_RACS(i) = sum(s_rimanenti.^2) / dim_denom;
        end
    end
    
    % Compressione dati via Deviazione / sqrt(N)
    perc_med(k) = mean(val_perc);
    perc_err(k) = std(val_perc) / sqrt(N_proved);
    
    P1_med(k) = mean(val_P1);
    P1_err(k) = std(val_P1) / sqrt(N_proved);
    
    racs_med(k) = mean(val_RACS);
    racs_err(k) = std(val_RACS) / sqrt(N_proved);
    
    disp(sprintf('-> %.2f processata (P_perc=%.2f)', p, perc_med(k)));
end

time_tot = toc;
disp(sprintf('Ciclo M-Carlo Estinto in %.1f sec. Stampo layout visivi...', time_tot));

%% === 3. ESTETICA E ERRORBAR ===

% Figura Globale Unificata in Subplots
figure('Name', 'Analisi Termodinamica Completa - Subplot', 'Position', [100 100 1400 450]);

% Pannello 1: Percolazione Classica
subplot(1, 3, 1);
errorbar(p_color, perc_med, perc_err, 'g-o', 'LineWidth', 1.5, 'MarkerFaceColor','g');
grid on; hold on;
plot([0 1], [0.5 0.5], 'r--', 'HandleVisibility', 'off'); 
title(sprintf('Transizione di Fase L=%d', L));
xlabel('Densità Colorazione (p_{col})');
ylabel('P_{perc} (Prob. di Percolamento)');

% Pannello 2: Forza del Cluster Primario (P1)
subplot(1, 3, 2);
errorbar(p_color, P1_med, P1_err, 'b-d', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
grid on;
title(sprintf('Rateo Cluster Dominante P_1 (L=%d)', L));
xlabel('Densità Colorazione (p_{col})');
ylabel('s_{max} / L^2 (Copertura C.)');

% Pannello 3: RACS 
subplot(1, 3, 3);
errorbar(p_color, racs_med, racs_err, 'm-p', 'LineWidth', 1.5, 'MarkerFaceColor', 'm');
grid on;
title(sprintf('Reduced Average Cluster Size (L=%d)', L));
xlabel('Densità Colorazione (p_{col})');
ylabel('RACS');

disp('=== FINE SCRIPT ===');
