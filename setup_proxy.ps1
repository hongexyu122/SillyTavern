$configFile = "config.yaml"
if (Test-Path $configFile) {
    (Get-Content $configFile) -replace 'enableServerPlugins: false', 'enableServerPlugins: true' | Set-Content $configFile
    Write-Host "Config updated." -ForegroundColor Green
} else {
    Write-Host "Error: config.yaml not found in current directory." -ForegroundColor Red
    cmd /c 'pause'
    exit
}

$pluginDir = "plugins"
if (Test-Path $pluginDir) {
    Push-Location $pluginDir
    Write-Host "Cloning server plugin..." -ForegroundColor Cyan
    git clone -b server https://github.com/starowo/AIStudioBuildProxy.git
    Pop-Location
} else {
    Write-Host "Error: Directory 'plugins' not found." -ForegroundColor Red
    cmd /c 'pause'
    exit
}

$clientDir = "public/scripts/extensions/third-party"
if (Test-Path $clientDir) {
    Push-Location $clientDir
    Write-Host "Cloning client extension..." -ForegroundColor Cyan
    git clone -b client https://github.com/starowo/AIStudioBuildProxy.git
    Pop-Location
} else {
    Write-Host "Error: Directory '$clientDir' not found." -ForegroundColor Red
    cmd /c 'pause'
    exit
}

Write-Host "Done!" -ForegroundColor Green
Read-Host -Prompt "Press Enter to exit"