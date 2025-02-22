# Conda Cheatsheet

## 🚀 Quick Start
```bash
# Install conda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh

# Initialize
conda init bash
```

## 📦 Package Management
```bash
conda install PACKAGE              # Install package
conda install PACKAGE=VERSION      # Install specific version
conda remove PACKAGE              # Remove package
conda list                       # List installed packages
conda search PACKAGE             # Search for package
```

## 🌍 Environment Management
```bash
conda create --name ENV           # Create environment
conda activate ENV               # Activate environment
conda deactivate                # Deactivate environment
conda env list                  # List environments
conda env export > env.yml      # Export environment
conda env create -f env.yml     # Create from file
```

## 🔄 Updates
```bash
conda update conda               # Update conda
conda update --all              # Update all packages
conda update PACKAGE            # Update specific package
```

## 🧹 Maintenance
```bash
conda clean --all               # Clean all caches
conda info                     # System information
conda config --show            # Show configuration
```

## 📊 Channels
```bash
conda config --add channels CHANNEL    # Add channel
conda config --remove channels CHANNEL # Remove channel
conda config --show channels          # Show channels
```

## 🔧 Troubleshooting
```bash
conda doctor                    # Check health
conda clean --index-cache      # Clean index
conda install --force-reinstall # Force reinstall
```

## 🎯 Common Tasks
```bash
# Create data science environment
conda create -n ds_env python numpy pandas scikit-learn

# Create web development environment
conda create -n web_env python django flask

# Create ML environment
conda create -n ml_env python tensorflow pytorch
```

## ⚡ Performance Tips
```bash
conda config --set channel_priority strict
conda clean --all
conda install mamba -c conda-forge  # Faster solver
```

## 🔒 Security
```bash
conda config --set ssl_verify true
conda verify PACKAGE
conda update --security-only
```

## 🔍 Information
```bash
conda info --envs               # Environment info
conda list --explicit          # Explicit package list
conda config --show-sources    # Show config sources
```