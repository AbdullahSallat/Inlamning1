# Inlamning1

# Strukturverktyg

## Beskrivning
Det här PowerShell-skriptet skapar en enkel mappstruktur för ett projekt:
1. Frågar dig om ett namn (t.ex. `kundsystem`).
2. Skapar en huvudmapp med det namnet.
3. Lägger till tre undermappar:  
   - `logs`  
   - `scripts`  
   - `temp`
4. I `logs`-mappen skapas en fil `log-ÅÅÅÅ-MM-DD.txt` som innehåller en rad:  
All log är samlad i funktionen `SkapaStruktur`, och fel hanteras med `try/catch` så att du får tydlig återkoppling om något går fel.
