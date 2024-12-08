Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$logFile = "C:\path\log.txt"
Start-Transcript -Path $logFile

try {
    # Пример команды
    $ft = "[Тег1]"
$rt = "замена"
$word = New-Object -ComObject Word.Application
$word.Visible = $true
$document = $word.Documents.Open('C:\\Users\\Dmitry\\Documents\\electronstydy\\word.docx')
$range = $document.Content
$find = $range.Find
$find.Execute($ft, $true, $true, $false, $false, $false, $false, 0, 0, $rt, 2) | Out-Null
}
catch {
    Write-Host "Произошла ошибка: $_"
}

Stop-Transcript



