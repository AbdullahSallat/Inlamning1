# strukturverktyg.ps1
# Skapar en mappstruktur (logs, scripts, temp) och en loggfil

# 1. Fråga användaren om namn
$mappNamn = Read-Host "Ange namn för mappstrukturen (t.ex. kundsystem)"
if ([string]::IsNullOrWhiteSpace($mappNamn)) {   # ser till att användaren inte bara trycker Enter. Om fältet är tomt avslutas skriptet med en varning.
    Write-Host "Du måste ange ett giltigt namn!" -ForegroundColor Yellow
    exit
}
