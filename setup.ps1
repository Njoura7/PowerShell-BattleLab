function New-GameUser {
    param (
        [string]$Username,
        [string]$Password
    )
    New-LocalUser -Name $Username -Password (ConvertTo-SecureString -AsPlainText $Password -Force) -AccountNeverExpires
}

function New-ReadmeFile {
    param (
        [string]$Username,
        [string]$Content
    )
    $desktopPath = "C:\Users\$Username\Desktop"
    $readmePath = Join-Path $desktopPath "README.txt"
    $Content | Out-File -FilePath $readmePath -Force
}

# Level 1: Given Credentials
New-GameUser -Username "user1" -Password "Level1Pass"
New-ReadmeFile -Username "user" -Content "Log into user1 with password 'Level1Pass'."

# Level 2: PowerShell Version as Password
$psVersion = $PSVersionTable.PSVersion.Major.ToString()
New-GameUser -Username "user2" -Password $psVersion
New-ReadmeFile -Username "user1" -Content "Find the PowerShell version. Log into user2 with that version number as the password."

# Level 3: Find Credentials in a File
$level3Username = "user3"
$level3Password = "Level3Pass"
New-Item -Path "C:\Users\user2\Documents\credentials.txt" -ItemType File -Value "Username: $level3Username`nPassword: $level3Password"
New-GameUser -Username $level3Username -Password $level3Password
New-ReadmeFile -Username "user2" -Content "Find the file 'credentials.txt' in Documents. Use its contents to log into the next level."

# Level 4: Extract Credentials from Event Log
$level4Username = "user4"
$level4Password = "Level4Pass"
Write-EventLog -LogName Application -Source "PowerShellWarGame" -EventId 100 -Message "Username: $level4Username, Password: $level4Password"
New-GameUser -Username $level4Username -Password $level4Password
New-ReadmeFile -Username "user3" -Content "Find the event log entry with Event ID 100 from 'PowerShellWarGame'. Use the credentials in the message."

# Level 5: Modify and Use Registry Value
$level5Username = "user5"
$level5RegPath = "HKCU:\Software\PowerShellWarGame"
$level5Password = Get-Random -Maximum 10000
New-Item -Path $level5RegPath -Force
Set-ItemProperty -Path $level5RegPath -Name "Level5Password" -Value $level5Password
New-GameUser -Username $level5Username -Password $level5Password.ToString()
New-ReadmeFile -Username "user4" -Content "Modify the registry value 'Level5Password' at '$level5RegPath'. Use the new value as the password for user5."
