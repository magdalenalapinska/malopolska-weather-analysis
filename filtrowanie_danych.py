import csv
import os
import math

miasta = ["KRAKÓW-OBSERWATORIUM", "ŁĄCKO", "BUKOWINA TATRZAŃSKA", "LIMANOWA"]

for rok in range(2016, 2026):
    dane_z_tego_roku = []

    print(f"Oczyszczam dane z roku {rok}...")

    for m in range(1, 13):
        nazwa_pliku = f"{rok}/k_d_{m:02d}_{rok}.csv"

        if not os.path.exists(nazwa_pliku):
            continue

        with open(nazwa_pliku, mode='r', encoding='windows-1250') as file:
            csvFile = csv.reader(file)
            for lines in csvFile:
                if len(lines) > 9:
                    nazwa_stacji = lines[1].strip().upper()
                    if nazwa_stacji in miasta:
                        try:
                            rok_pomiaru = int(lines[2])
                            miesiac_pomiaru = int(lines[3])
                            dzien_pomiaru = int(lines[4])
                            temp = float(lines[9])

                            # FILTROWANIE TEMPERATUR
                            if math.isnan(temp) or temp > 50 or temp < -50:
                                continue

                            if miesiac_pomiaru in [12, 1, 2] and temp > 16:
                                continue

                            if miesiac_pomiaru in [6, 7, 8] and temp < 5:
                                continue

                            dane_z_tego_roku.append([rok_pomiaru, miesiac_pomiaru, dzien_pomiaru, nazwa_stacji, temp])
                        except ValueError:
                            continue

    if len(dane_z_tego_roku) > 0:
        nazwa_pliku_wyjsciowego = f"przefiltrowane_dane_{rok}.csv"
        with open(nazwa_pliku_wyjsciowego, mode='w', encoding='utf-8', newline='') as f:
            writer = csv.writer(f)
            writer.writerow(['Rok', 'Miesiac', 'Dzien', 'Stacja', 'Temperatura'])
            writer.writerows(dane_z_tego_roku)

print("Przefiltrowano pliki.")