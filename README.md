# malopolska-weather-analysis
Projekt w języku Python służący do ekstrakcji, filtrowania i analizy danych meteorologicznych (IMGW) dla województwa małopolskiego z lat 2016-2025. Obejmuje oczyszczanie surowych danych z błędów pomiarowych oraz wyznaczanie regionalnych trendów za pomocą aproksymacji wielomianowej 6. stopnia.


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
* **Język:** Python 3
* **Wbudowane biblioteki:** `csv`, `os`, `math`
* **Analiza i wizualizacja (zależności):** Metody numeryczne (aproksymacja wielomianowa)

---

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

1. Sklonuj repozytorium:
   ```bash
   git clone [https://github.com/TwojLogin/malopolska-weather-analysis.git](https://github.com/TwojLogin/malopolska-weather-analysis.git)
