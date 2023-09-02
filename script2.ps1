# Specifying the directory to start the search
$startingDirectory = "C:\Users\admin\Desktop"

# Getting all files in the directory and its subdirectories
$files = Get-ChildItem -Path $startingDirectory -File -Recurse

# Filtering files larger than 100 MB
$largeFiles = $files | Where-Object { $_.Length -gt 100MB }

# Sortting the large files by size in descending order in our case, this is the directory: "C:\Users\admin\Desktop"
$largeFilesSorted = $largeFiles | Sort-Object -Property Length -Descending

# Displaying the list of large files
$largeFilesSorted | ForEach-Object {
    $sizeInMB = [math]::Round($_.Length / 1MB, 2)
    Write-Host ("File: {0} | Size: {1} MB" -f $_.FullName, $sizeInMB)
}

#Note, this code can be executed using command prompt command: powershell -File script2.ps1
