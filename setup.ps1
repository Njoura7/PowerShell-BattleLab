function PlaceSecretFileAndGetDirectoryName {
    # Example logic to create 'secret.txt' in a random directory
    # For simplicity, let's just use a fixed directory
    $directoryPath = "C:\Game\Level1"
    New-Item -ItemType Directory -Path $directoryPath -Force
    New-Item -ItemType File -Path "$directoryPath\secret.txt" -Force
    return Split-Path $directoryPath -Leaf
}

function CreateReadmeFile {
    param (
        [string]$Username,
        [string]$Content
    )
    $desktopPath = "C:\Users\$Username\Desktop"
    $readmePath = Join-Path $desktopPath "README.txt"
    $Content | Out-File -FilePath $readmePath -Force
}

# Creating user1 with a default password
New-LocalUser -Name "user1" -Password (ConvertTo-SecureString -AsPlainText "Passw0rd!" -Force)

# Place 'secret.txt' and get the directory name for user2's password
$user2Password = PlaceSecretFileAndGetDirectoryName

# Create README for user1 with instructions on Desktop
CreateReadmeFile -Username "user1" -Content "Find 'secret.txt'. Its directory name is your next password."

# Creating user2 with the password derived from Task 1
New-LocalUser -Name "user2" -Password (ConvertTo-SecureString -AsPlainText $user2Password -Force)

# Create README for user2 with next task instructions on Desktop
CreateReadmeFile -Username "user2" -Content "Find the main version number of PowerShell. This is your password for user3."

# Determine PowerShell version for user3's password
$user3Password = $PSVersionTable.PSVersion.Major.ToString()

# Creating user3 with the PowerShell version number as the password
New-LocalUser -Name "user3" -Password (ConvertTo-SecureString -AsPlainText $user3Password -Force)

# Create README for user3 with instructions on Desktop
CreateReadmeFile -Username "user3" -Content "Your task is to find the secret code in 'code.txt'. This is your password for user4."
