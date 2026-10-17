# Create 100 text files and open them all simultaneously

$folder = Join-Path $env:USERPROFILE "Desktop\100TextFiles"

# Create the output folder
New-Item -Path $folder -ItemType Directory -Force | Out-Null

# Create 100 text files
1..100 | ForEach-Object {
    $filePath = Join-Path $folder "File$_.txt"
    Set-Content -Path $filePath -Value "This is text file number $_."
}

# Open all 100 files simultaneously
1..100 | ForEach-Object {
    $filePath = Join-Path $folder "File$_.txt"
    Start-Process notepad.exe -ArgumentList "`"$filePath`""
}

Write-Host "Created and opened all 100 text files!"
