# 🌡️ Analiza Danych Meteorologicznych (Małopolska 2016-2025)

## 📝 O projekcie
Projekt to system analizy i przetwarzania dobowych danych meteorologicznych pozyskanych z Instytutu Meteorologii i Gospodarki Wodnej (IMGW) dla województwa małopolskiego na przestrzeni dekady **2016-2025**. 

Celem skryptów jest automatyczna ekstrakcja surowych plików CSV, zaawansowane czyszczenie danych (data cleaning) z błędów pomiarowych, a następnie modelowanie matematyczne i wizualizacja wahań temperatury dla całego regionu.

### 📍 Analizowane stacje pomiarowe:
* **Kraków-Obserwatorium** (obszar miejski / nizinny)
* **Łącko** (obszar przedgórski / dolina)
* **Limanowa** (obszar górski / kotlinowy)
* **Bukowina Tatrzańska** (obszar wysokogórski)

---

## 🛠️ Technologie
* **Przetwarzanie danych:** Python 3 (`csv`, `os`, `math`)
* **Wizualizacja i modelowanie matematyczne:** MATLAB
* **Formaty danych wejściowych/wyjściowych:** CSV

---

## ⚙️ Architektura rozwiązania
Projekt został podzielony na dwa główne etapy:
1. **Oczyszczanie danych (Python):** Skrypt `filtrowanie_danych.py` ekstrahuje surowe dane i filtruje anomalie oraz błędy pomiarowe, tworząc zagregowane pliki CSV (np. `przefiltrowane_dane_2016.csv`).
2. **Wizualizacja i aproksymacja (MATLAB):** Skrypty `.m` (np. `wykresy_temperatury_dobowe.m`) pobierają oczyszczone pliki CSV, wykonują na nich aproksymację wielomianową 6. stopnia i generują profesjonalne wykresy przebiegu temperatur.

## ⚙️ Logika filtrowania danych (`filtrowanie_danych.py`)
Surowe dane z IMGW (pliki w formacie `k_d_MM_YYYY.csv`) często zawierają anomalie sprzętowe lub braki. Napisany skrypt Python przechodzi przez dane miesiąc po miesiącu i aplikuje ścisłe filtry walidacyjne:

1. **Filtrowanie zakresu i braków:** Odrzucanie pustych wartości (`NaN`) oraz ekstremów pomiarowych spoza fizycznego zakresu od **-50°C** do **50°C**.
2. **Korekta błędów logicznych (sezonowych):**
   * **Zima** (miesiące: 12, 1, 2): Odrzucanie anomalnych temperatur powyżej **16°C**.
   * **Lato** (miesiące: 6, 7, 8): Odrzucanie anomalnych temperatur poniżej **5°C**.
3. **Eksport:** Poprawne dane są formatowane i zapisywane do zagregowanych plików rocznych (np. `przefiltrowane_dane_2016.csv`), gotowych do dalszej analizy numerycznej.

---

## 📈 Modelowanie matematyczne i Wnioski
Oczyszczone dane posłużyły do wyznaczenia uśrednionego trendu dla całego regionu. Aby wygładzić dobowe skoki temperatur i wyraźnie zobrazować powtarzalne cykle sezonowe dla badanej dekady, zastosowano **aproksymację wielomianową 6. stopnia**.

**Główne wnioski z analizy:**
* **Topografia ma kluczowe znaczenie:** Występuje bardzo wyraźna zależność temperatur od położenia geograficznego i wysokości nad poziomem morza (n.p.m.).
* **Skrajności:** Konsekwentnie najwyższe średnie temperatury odnotowano dla stacji *Kraków-Obserwatorium*, podczas gdy najniższe dla *Bukowiny Tatrzańskiej*.
* **Amplitudy:** Stacje położone w specyficznym terenie, takie jak *Łącko* i *Limanowa*, wykazują znacznie większe dobowe amplitudy (wahania) temperatur niż stacje skrajne.

---

## 🚀 Jak uruchomić projekt?

1. **Krok 1: Przetwarzanie (Python)**
   * Upewnij się, że surowe dane IMGW (katalogi z latami `2016`-`2025`) znajdują się w głównym folderze.
   * Uruchom skrypt w terminalu:
     ```bash
     python filtrowanie_danych.py
     ```
   * Skrypt wygeneruje roczne pliki `.csv` z oczyszczonymi danymi.

2. **Krok 2: Generowanie wykresów (MATLAB)**
   * Otwórz środowisko MATLAB.
   * Uruchom plik `wykresy_temperatury_dobowe.m` w celu wygenerowania wykresów dla poszczególnych stacji.
   * Uruchom plik `wykres_analiza_regionu_2016.m` w celu nałożenia aproksymacji wielomianowej dla całego regionu.
