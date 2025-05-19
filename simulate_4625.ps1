$username = "test_soc"
$passwords = @("pass1", "pass2", "pass3", "pass4", "pass5", "pass6", "pass7", "pass8", "pass9", "pass10")

foreach ($p in $passwords) {
    try {
        $securePassword = ConvertTo-SecureString $p -AsPlainText -Force
        $cred = New-Object System.Management.Automation.PSCredential ($username, $securePassword)
        Start-Process "cmd.exe" -Credential $cred -ErrorAction Stop
    } catch {
        Write-Host "Tentative échouée avec : $p"
    }
    Start-Sleep -Milliseconds 500
}
