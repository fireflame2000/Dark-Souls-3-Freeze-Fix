# Dark Souls III CPU 0 launcher
# Starts the game through Steam (if it isn't already running), waits for it to appear,
# takes CPU 0 away from it, then exits. Nothing keeps running in the background.
# Windows keeps the setting until the game closes; run this again next time you play.

$GameProcess = "DarkSoulsIII"
$SteamAppId  = 374320      # Dark Souls III
$WaitSeconds = 120         # how long to wait for the game to start

$game = Get-Process -Name $GameProcess -ErrorAction SilentlyContinue | Select-Object -First 1
if (-not $game) {
    Write-Host "Starting Dark Souls III through Steam..."
    Start-Process "steam://rungameid/$SteamAppId"
    $deadline = (Get-Date).AddSeconds($WaitSeconds)
    while (-not $game -and (Get-Date) -lt $deadline) {
        Start-Sleep -Seconds 1
        $game = Get-Process -Name $GameProcess -ErrorAction SilentlyContinue | Select-Object -First 1
    }
    if (-not $game) {
        Write-Host "The game didn't start within $WaitSeconds seconds. Nothing was changed."
        Start-Sleep -Seconds 8
        exit 1
    }
    Start-Sleep -Seconds 3   # let it finish starting up
}

try {
    $game.Refresh()
    $current = [Int64]$game.ProcessorAffinity
    $new = $current -band (-bnot [Int64]1)
    if ($new -eq $current) {
        Write-Host "The game already isn't using CPU 0."
    } elseif ($new -eq 0) {
        Write-Host "CPU 0 is the only CPU the game has, so I left it alone."
    } else {
        $game.ProcessorAffinity = [IntPtr]$new
        Write-Host "Done: CPU 0 taken away from Dark Souls III."
    }
    Start-Sleep -Seconds 2
} catch {
    Write-Host "Couldn't change the game's CPU affinity: $($_.Exception.Message)"
    Start-Sleep -Seconds 10
    exit 1
}
