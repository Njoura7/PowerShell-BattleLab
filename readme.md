# PowerShell War Game

## Description

This PowerShell War Game is an interactive learning tool designed to teach PowerShell and basic Windows system administration in a gamified way. Each level of the game involves completing a PowerShell task, with the outcome leading to credentials needed for accessing the next level.

---

## How It Works

The game is set up as a series of user accounts on a Windows system. Each user account has a specific task that needs to be solved using PowerShell. Completing a task provides the credentials (username and password) for the next user account, which presents the next challenge. The challenges range from basic file operations to more complex tasks involving system configuration.

---

## Setup

### Prerequisites

- Windows system with administrative privileges (or VM which will be available in future implementation).
- PowerShell installed.

### Installation

**Clone the repository:**

```bash
git clone <repository-url>
```

### Run the setup script:

`.\setup.ps1`

This script will create user accounts and set up tasks for each level.

### Starting the Game

Log in to the first user account created by the setup script. Follow the instructions provided in the README file on the desktop to complete each level.

### Levels

- Level 1: Find a file and use the directory name as the password for the next level.
- Level 2: Determine the PowerShell version to access the next level.
- Level 3: Locate credentials in a specific file.
- ... (more levels as per the script)

---

## Contributing

Contributions to the PowerShell War Game are welcome! If you have ideas for new levels, bug fixes, or enhancements, feel free to fork the repository and submit a pull request.

---

## License

This project is open-source and available under the MIT License.
