# Conda Installation Guide

## System Requirements

- Windows 7 or newer
- macOS 10.13+
- Linux (including WSL)

## Installation Steps

### Windows

1. Download the Miniconda installer for Windows from the [official website](https://docs.conda.io/en/latest/miniconda.html)
2. Run the installer (.exe file)
3. Follow the installation wizard, accepting default options
4. Open Command Prompt or PowerShell
5. Verify installation by typing: `conda --version`

### macOS

#### Method 1: Using Homebrew (Recommended)

1. Install Homebrew if not already installed:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
2. Install Miniconda using brew:
   ```bash
   brew install --cask miniconda
   ```
3. Initialize conda for your shell:
   ```bash
   conda init "$(basename "${SHELL}")"
   ```
4. Update conda to the latest version:

   ```bash
   conda update conda
   ```

5. Create your first environment:

   ```bash
   conda create --name myenv python=3.9
   ```

6. Activate the environment:
   ```bash
   conda activate myenv
   ```

## Environment Configuration

1. Set up conda-forge as a priority channel:

   ```bash
   conda config --add channels conda-forge
   conda config --set channel_priority strict
   ```

2. Configure auto-activation of base environment (optional):
   ```bash
   conda config --set auto_activate_base false
   ```

## Verification Steps

1. Check conda version:

   ```bash
   conda --version
   ```

2. List available environments:

   ```bash
   conda env list
   ```

3. Check Python version:
   ```bash
   python --version
   ```

## Troubleshooting Common Issues

### Path Issues

- **Windows**: Add Conda to PATH via System Properties > Environment Variables
- **macOS/Linux**: Add to shell profile:
  ```bash
  export PATH="/opt/miniconda3/bin:$PATH"
  ```

### Permission Issues

- **macOS/Linux**: Fix permissions with:
  ```bash
   chmod -R u+w ~/miniconda3
  ```

### Shell Integration

- If conda isn't recognized after installation:
  ```bash
  source ~/.bashrc  # For bash
  source ~/.zshrc   # For zsh
  ```

## Uninstallation Steps (if needed)

### Windows

1. Use Windows Settings > Apps > Apps & features
2. Find and uninstall Miniconda3

### macOS/Linux

1. Remove Miniconda installation:
   ```bash
   rm -rf ~/miniconda3
   ```
2. Remove initialization code from shell profile:
   ```bash
   # Edit ~/.bashrc or ~/.zshrc and remove conda initialization block
   ```

## Additional Resources

- [Official Conda Documentation](https://docs.conda.io/)
- [Conda Cheat Sheet](https://docs.conda.io/projects/conda/en/latest/user-guide/cheatsheet.html)
- [Conda-forge](https://conda-forge.org/)

  ```

  ```

4. Restart your terminal
5. Verify installation: `conda --version`

#### Method 2: Manual Installation

1. Download the Miniconda installer for macOS from the [official website](https://docs.conda.io/en/latest/miniconda.html)
2. Open Terminal
3. Navigate to Downloads directory: `cd ~/Downloads`
4. Make the installer executable: `chmod +x Miniconda3-latest-MacOSX-x86_64.sh`
5. Run the installer: `./Miniconda3-latest-MacOSX-x86_64.sh`
6. Follow the prompts, accepting the license terms
7. Let the installer initialize Miniconda3
8. Restart your terminal
9. Verify installation: `conda --version`

### Linux

1. Download the Miniconda installer for Linux from the [official website](https://docs.conda.io/en/latest/miniconda.html)
2. Open terminal
3. Navigate to Downloads directory: `cd ~/Downloads`
4. Make the installer executable: `chmod +x Miniconda3-latest-Linux-x86_64.sh`
5. Run the installer: `./Miniconda3-latest-Linux-x86_64.sh`
6. Follow the prompts, accepting the license terms
7. Let the installer initialize Miniconda3
8. Restart your terminal
9. Verify installation: `conda --version`

## Post-Installation Setup

1. Update conda to the latest version:
   ```bash
   conda update conda
   ```
