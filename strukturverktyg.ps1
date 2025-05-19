# strukturverktyg.ps1
# Skapar en mappstruktur (logs, scripts, temp) och en loggfil

# 1. Fråga användaren om namn
$mappNamn = Read-Host "Ange namn för mappstrukturen (t.ex. kundsystem)"
if ([string]::IsNullOrWhiteSpace($mappNamn)) {   # ser till att användaren inte bara trycker Enter. Om fältet är tomt avslutas skriptet med en varning.
    Write-Host "Du måste ange ett giltigt namn!" -ForegroundColor Yellow
    exit
}

# 2. Bygg sökvägen till huvudmappen
$huvudPath = Join-Path -Path (Get-Location) -ChildPath $mappNamn

try {
    # 3. Skapa huvudmappar om de inte finns
    if (-Not (Test-Path $huvudPath)) {
        New-Item -ItemType Directory -Path $huvudPath | Out-Null
        Write-Host "Huvudmapp '$mappNamn' skapad."
    }
    else {
        Write-Host "Huvudmappen '$mappNamn' finns redan."
    }

    # 4. Skapa undermapparna
    $undermappar = @("logs","scripts","temp")
    foreach ($sub in $undermappar) {
        $subPath = Join-Path -Path $huvudPath -ChildPath $sub
        if (-Not (Test-Path $subPath)) {
            New-Item -ItemType Directory -Path $subPath | Out-Null
            Write-Host "    Undermapp '$sub' skapad."
        }
        else {
            Write-Host "    Undermapp '$sub' finns redan."
        }
    }

    # 5. Skapa loggfil med datum i namnet
    $datum    = Get-Date -Format yyyy-MM-dd
    $loggFil  = Join-Path -Path (Join-Path $huvudPath "logs") -ChildPath "log-$datum.txt"
    $tid      = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "Struktur skapad: $tid" | Out-File -FilePath $loggFil 
    Write-Host "Loggfil skapad: $loggFil"
}
catch {
    Write-Host "Fel vid skapande: $_" -ForegroundColor Red
}
