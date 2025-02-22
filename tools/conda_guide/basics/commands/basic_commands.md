# Basic Conda Commands

## Quick Reference

| Operation | Command | Description |
|-----------|---------|-------------|
| Version Check | `conda --version` | Display conda version |
| System Info | `conda info` | Show conda system information |
| List Environments | `conda env list` | Show all conda environments |
| Activate Environment | `conda activate myenv` | Switch to specified environment |
| Deactivate Environment | `conda deactivate` | Exit current environment |
| Update Conda | `conda update conda` | Update conda itself |
| Clean Cache | `conda clean --all` | Remove unused packages and cache |
| Show Config | `conda config --show` | Display conda configuration |
| Add Channel | `conda config --add channels channel_name` | Add new package channel |

## System Information

### Check Conda Version
```bash
conda --version
```

### Get Conda Info
```bash
conda info
```

### List Available Python Versions
```bash
conda search python
```

## Environment Navigation

### List All Environments
```bash
conda env list
# or
conda info --envs
```

### Activate Environment
```bash
conda activate myenv
```

### Deactivate Current Environment
```bash
conda deactivate
```

### Get Current Environment Location
```bash
conda info --envs | grep '*'
```

## System Updates

### Update Conda
```bash
conda update conda
```

### Update All Packages in Environment
```bash
conda update --all
```

### Clean Unused Packages and Cache
```bash
conda clean --all
```

## Help Commands

### General Help
```bash
conda --help
```

### Command-Specific Help
```bash
conda create --help
conda install --help
```

## Configuration

### Show Configuration
```bash
conda config --show
```

### Get Channel List
```bash
conda config --show channels
```

### Add Channel
```bash
conda config --add channels conda-forge