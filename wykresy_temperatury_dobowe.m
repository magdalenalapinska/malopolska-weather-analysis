clear all
clc

miasta = {'KRAKÓW-OBSERWATORIUM', 'ŁĄCKO', 'BUKOWINA TATRZAŃSKA', 'LIMANOWA'};

for rok = 2016:2025
    nazwa_pliku = sprintf('przefiltrowane_dane_%d.csv', rok);
    dane = readtable(nazwa_pliku);
    
    fig = figure('Visible', 'off', 'Name', sprintf('Wykres %d', rok), 'Position', [100, 100, 1000, 500]);
    hold on;
    grid on;
    
    for i = 1:length(miasta)
        obecne_miasto = miasta{i};
        maska = strcmp(dane.Stacja, obecne_miasto);
        temperatury = dane.Temperatura(maska);
        
        plot(temperatury, 'LineWidth', 1.2, 'DisplayName', obecne_miasto);
    end
    
    % Wykresy
    title(sprintf('Przebieg temperatur dobowych - Rok %d', rok));
    xlabel('Kolejne dni pomiarowe');
    ylabel('Temperatura [°C]');
    legend('Location', 'best');
    
    % Zapis do pliku PNG
    nazwa_zapisu = sprintf('Wykres_dzienny_%d.png', rok);
    saveas(fig, nazwa_zapisu);
    
    close(fig);
    
end

