% Test_Efficienza.m
% Script per profilare strutturalmente la comparazione HK vs Flood-Fill.
% Disegna due tracciati adatti al report e all'esame orale.

clear; clc; close all;

%% 1. Test Lineare: Fissiamo P, Variamo Scala (L)
p_fisso = 0.55; % Soglia pre-critica bella densa
L_array = [50, 100, 200, 300, 400, 600]; % Taglie progressive
tempi_base_L = zeros(1, length(L_array));
tempi_hk_L = zeros(1, length(L_array));

disp('--- [1/2] Avvio test scalabilita su L (Taglia Reticolo) ---');
for i = 1:length(L_array)
    L = L_array(i);
    M = rand(L) < p_fisso;
    
    tic; CercaCluster(L, p_fisso, M); tempi_base_L(i) = toc;
    tic; HK(L, p_fisso, M); tempi_hk_L(i) = toc;
    
    disp([' -> Griglia ' num2str(L) 'x' num2str(L) ' valutata.']);
end

%% 2. Test Condizionale: Fissiamo L, Variamo P
L_fisso = 400; % Matrice costosa quanto basta x stancare il flooding
p_array = 0.1:0.1:0.9;
tempi_base_p = zeros(1, length(p_array));
tempi_hk_p = zeros(1, length(p_array));

disp('--- [2/2] Avvio test di sforzo su p (Densita colore) ---');
for i = 1:length(p_array)
    p = p_array(i);
    M = rand(L_fisso) < p;
    
    tic; CercaCluster(L_fisso, p, M); tempi_base_p(i) = toc;
    tic; HK(L_fisso, p, M); tempi_hk_p(i) = toc;
    
    disp([' -> p = ' num2str(p) ' valutata.']);
end

%% Generazione Figure 
fig1 = figure('Name', 'Analisi Efficienza Computazionale', 'Position', [100 100 1000 450]);

% Riquadro 1 (L scale)
subplot(1,2,1);
plot(L_array, tempi_base_L, 'r-o', 'LineWidth', 1.5, 'MarkerFaceColor','r'); hold on;
plot(L_array, tempi_hk_L, 'b-s', 'LineWidth', 1.5, 'MarkerFaceColor','b');
grid on;
title(sprintf('Esecuzione vs Taglia (p_{col} = %0.2f)', p_fisso));
xlabel('Taglia Reticolo (L)');
ylabel('Tempo d''Esecuzione (secondi)');
legend('CercaCluster (Flood)', 'HK (Union-Find)', 'Location', 'NorthWest');

% Riquadro 2 (p scale)
subplot(1,2,2);
plot(p_array, tempi_base_p, 'r-o', 'LineWidth', 1.5, 'MarkerFaceColor','r'); hold on;
plot(p_array, tempi_hk_p, 'b-s', 'LineWidth', 1.5, 'MarkerFaceColor','b');
grid on;
title(sprintf('Esecuzione vs Densità (L = %d)', L_fisso));
xlabel('Probabilità Colorazione (p_{col})');
ylabel('Tempo d''Esecuzione (secondi)');
legend('CercaCluster (Flood)', 'HK (Union-Find)', 'Location', 'NorthWest');

disp('Test Efficienza conclusi. Snapshot salvabile!');
