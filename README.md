# Plan Treningowy

Aplikacja PWA do własnego planu treningowego. Działa na iPhonie jak zwykła aplikacja
(ikona na ekranie głównym), także **offline** na siłowni. Dane są zapisane **tylko na telefonie**.

## Co potrafi
- **Plan** – dowolna liczba planów i dni (dodawanie, zmiana nazwy, przesuwanie ← →, usuwanie).
  Każde ćwiczenie: serie, zakres powtórzeń, RIR, przerwa, tempo, notatka o technice.
- **Trening** – wpisywanie kg / powtórzeń / RIR dla każdej serii, podgląd wyniku z poprzedniego
  razu, minutnik przerwy po odhaczeniu serii, dodawanie/usuwanie serii i ćwiczeń w trakcie,
  notatki do ćwiczenia i całego treningu.
- **Historia** – zakończone treningi z seriami, objętością i notatkami.
- **Więcej** – baza własnych ćwiczeń (podpowiadana przy wpisywaniu), motyw jasny/ciemny,
  eksport/import kopii zapasowej (JSON).

## Pliki
```
index.html          ← cała aplikacja (wygląd + logika)
manifest.json       ← nazwa, ikona, kolory (instalacja na ekranie głównym)
service-worker.js   ← działanie offline
icons/              ← ikony aplikacji
serve.ps1 / uruchom-lokalnie.bat ← podgląd na komputerze
```

## Podgląd na komputerze
Dwuklik na `uruchom-lokalnie.bat`, potem otwórz `http://localhost:8000`.

## Instalacja na iPhonie
1. Wejdź na **https://app.netlify.com/drop** i przeciągnij cały ten folder.
2. Otwórz otrzymany adres `https://...netlify.app` w **Safari** na iPhonie.
3. **Udostępnij** → **Dodaj do ekranu początkowego** → **Dodaj**.

## Aktualizacja po zmianach
Zwiększ numer w `CACHE_NAME` w `service-worker.js` (np. `v1` → `v2`) i wgraj folder ponownie –
inaczej telefon może pokazywać starą wersję z pamięci.

## Kopia zapasowa
**Więcej → Eksportuj JSON** co jakiś czas (szczególnie przed zmianą telefonu lub czyszczeniem Safari).
Przywracanie: **Więcej → Importuj**.
