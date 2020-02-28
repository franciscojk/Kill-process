$processo = "cmd"
$LogFile = "C:\temp\kill-schtasks.log"
$data = Get-Date
"---" | Out-File -FilePath $LogFile -Append
$data.DateTime | Out-File -FilePath $LogFile -Append

Try{
    Get-process $processo -ErrorAction Stop | Stop-Process -Force
    if ($_.exception -eq $null){
        "Processo $processo parado com sucesso!" | Out-File -FilePath $LogFile -Append
    }else{
        "Nao foi possivel parar o processo $processo!" | Out-File -FilePath $LogFile -Append
    }
}Catch{
    "Nenhum processo $processo em execucao!" | Out-File -FilePath $LogFile -Append
}
