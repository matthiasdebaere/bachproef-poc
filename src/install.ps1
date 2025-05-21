if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Host "Git is geïnstalleerd." -ForegroundColor Green
}
else {
    Write-Host "Git is niet geïnstalleerd." -ForegroundColor Red
    Write-Host -NoNewLine 'Druk op Enter om door te gaan...';
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    Exit 1
}

if (Get-Command vagrant -ErrorAction SilentlyContinue) {
    Write-Host "Vagrant is geïnstalleerd." -ForegroundColor Green
}
else {
    Write-Host "Vagrant is niet geïnstalleerd." -ForegroundColor Red
    Write-Host -NoNewLine 'Druk op Enter om door te gaan...';
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    Exit 1
}

if (Get-Command VBoxManage -ErrorAction SilentlyContinue) {
    Write-Host "VirtualBox is geïnstalleerd." -ForegroundColor Green
}
else {
    Write-Host "VirtualBox is niet geïnstalleerd." -ForegroundColor Red
    Write-Host -NoNewLine 'Druk op Enter om door te gaan...';
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    Exit 1
}

Write-Host 'Wil je de Vagrant Boxes nu downloaden? (script zal falen zonder de Vagrant Boxes)'

$response = Read-Host -Prompt 'Antwoord (ja/nee)' 
$response = $response.Trim().ToLowerInvariant()

if ($response -eq 'ja') {
    Invoke-WebRequest -Uri 'https://filesender.belnet.be/download.php?token=b9efe7d2-ffe9-499d-9341-b070eec907f2&files_ids=3626328' -OutFile './ansible-awx.box'
    Invoke-WebRequest -Uri 'https://filesender.belnet.be/download.php?token=b9efe7d2-ffe9-499d-9341-b070eec907f2&files_ids=3626329' -OutFile './eve-ng.box'
    Invoke-WebRequest -Uri 'https://filesender.belnet.be/download.php?token=b9efe7d2-ffe9-499d-9341-b070eec907f2&files_ids=3626331' -OutFile './netbox.box'
    }

$vagrant_boxes = @("eve-ng", "netbox", "ansible-awx")

$installed_boxes = vagrant box list | ForEach-Object { ($_ -split '\s+')[0].ToLower() }

foreach ($box in $vagrant_boxes) {
    if ($installed_boxes -contains $box.ToLower()) {
        Write-Host "Vagrant Box $box is geïnstalleerd." -ForegroundColor Green
    }
    else {
        Write-Host "Vagrant Box $box wordt geïnstalleerd..." -ForegroundColor Yellow
        vagrant box add "$box.box" --name $box | Out-Null
        Write-Host "Vagrant Box $box is geïnstalleerd." -ForegroundColor Green
    }
}

vagrant up --no-parallel

Write-Host 'POC-omgeving klaar!' -ForegroundColor Green
Write-Host -NoNewLine 'Druk op Enter om door te gaan...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');