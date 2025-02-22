# Basic Conda Commands

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
```