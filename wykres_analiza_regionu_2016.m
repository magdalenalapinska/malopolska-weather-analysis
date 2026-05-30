clear all
clc

rok_wybrany = 2016; 
nazwa_pliku = sprintf('przefiltrowane_dane_%d.csv', rok_wybrany);

dane_rok = readtable(nazwa_pliku);

% Konwersja daty na dzień roku (1-366)
daty = datetime(dane_rok.Rok, dane_rok.Miesiac, dane_rok.Dzien);
dane_rok.DzienRoku = day(daty, 'dayofyear');

% Średnia z 4 stacji na każdy dzień
region = groupsummary(dane_rok, 'DzienRoku', 'mean', 'Temperatura');
dni_region = region.DzienRoku;
temp_region = region.mean_Temperatura;

% Wielomian 6. stopnia
wspolczynniki = polyfit(dni_region, temp_region, 6);
aproksymacja = polyval(wspolczynniki, dni_region);

fig11 = figure('Name', 'Analiza Regionalna', 'Position', [100, 100, 1000, 600]);
hold on;
grid on;

miasta = unique(dane_rok.Stacja);
kolory = lines(length(miasta)); 
for i = 1:length(miasta)
    maska = strcmp(dane_rok.Stacja, miasta{i});
    dane_stacji = dane_rok(maska, :);
    plot(dane_stacji.DzienRoku, dane_stacji.Temperatura, '.', ...
        'Color', [kolory(i,:) 0.3], 'MarkerSize', 7, 'DisplayName', miasta{i}); 
end

plot(dni_region, temp_region, '--', 'Color', [0.8 0.8 0.8], ...
    'LineWidth', 2, 'DisplayName', 'Średnia dla Regionu');

plot(dni_region, aproksymacja, 'r-', 'LineWidth', 3, 'DisplayName', 'Aproksymacja (Wielomian 6 st.)');

% Wykres
title(sprintf('Analiza temperatur dla regionu - Rok %d', rok_wybrany));
xlabel('Dzień roku');
ylabel('Temperatura [°C]');
legend('Location', 'southoutside', 'NumColumns', 3);

% Ustawienie zakresu osi X od 1 do 366
xlim([1 366]);
hold off;

saveas(fig11, 'Wykres_11_Finalny_Szary.png');