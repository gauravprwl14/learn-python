# Package Management Commands

## Installing Packages

### Basic Package Installation
```bash
conda install package_name
```

### Install Specific Version
```bash
conda install package_name=1.2.3
```

### Install Multiple Packages
```bash
conda install package1 package2 package3
```

### Install from Specific Channel
```bash
conda install --channel conda-forge package_name
```

## Package Information

### Search for Package
```bash
conda search package_name
```

### List Installed Packages
```bash
conda list
```

### List Package Versions Available
```bash
conda search package_name --info
```

### Check Package Dependencies
```bash
conda depends package_name
```

## Package Updates

### Update Single Package
```bash
conda update package_name
```

### Update Multiple Specific Packages
```bash
conda update package1 package2
```

### List Outdated Packages
```bash
conda list --outdated
```

## Package Removal

### Remove Package
```bash
conda remove package_name
```

### Remove Multiple Packages
```bash
conda remove package1 package2
```

### Remove Unused Dependencies
```bash
conda clean --packages
```

## Channel Management

### Add Channel
```bash
conda config --add channels new_channel
```

### Remove Channel
```bash
conda config --remove channels channel_name
```

### List Current Channels
```bash
conda config --show channels
```

## Advanced Package Operations

### Install from Requirements
```bash
conda install --file requirements.txt
```

### Export Dependencies
```bash
conda list --export > requirements.txt
```

### Install without Dependencies
```bash
conda install --no-deps package_name
```

### Force Reinstall Package
```bash
conda install --force-reinstall package_name
```