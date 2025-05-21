if (Get-Command git -ErrorAction SilentlyContinue) {
    #Write-Host "Git is geïnstalleerd." -ForegroundColor Green
}
else {
    Write-Host "Git is niet geïnstalleerd." -ForegroundColor Red
    Write-Host -NoNewLine 'Druk op Enter om door te gaan...';
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
}

if (Get-Command vagrant -ErrorAction SilentlyContinue) {
    #Write-Host "Vagrant is geïnstalleerd." -ForegroundColor Green
}
else {
    Write-Host "Vagrant is niet geïnstalleerd." -ForegroundColor Red
    Write-Host -NoNewLine 'Druk op Enter om door te gaan...';
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
}

if (Get-Command VBoxManage -ErrorAction SilentlyContinue) {
    #Write-Host "VirtualBox is geïnstalleerd." -ForegroundColor Green
}
else {
    Write-Host "VirtualBox is niet geïnstalleerd." -ForegroundColor Red
    Write-Host -NoNewLine 'Druk op Enter om door te gaan...';
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
}

$vagrant_boxes = @("eve-ng", "netbox", "ansible-awx")

$installed_boxes = vagrant box list | ForEach-Object { ($_ -split '\s+')[0].ToLower() }

foreach ($box in $vagrant_boxes) {
    if ($installed_boxes -contains $box.ToLower()) {
        vagrant box remove $box
    }
}

vagrant destroy -f

Write-Host 'POC-omgeving succesvol verwijderd!' -ForegroundColor Green
Write-Host -NoNewLine 'Druk op Enter om door te gaan...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');