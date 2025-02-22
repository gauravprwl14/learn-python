# Package Conflict Resolution Guide

## Identifying Conflicts

### Check Dependencies
```bash
# View package dependencies
conda list --explicit

# Check specific package dependencies
conda depends package_name
```

### Version Conflicts
```bash
# Show package versions
conda list package_name

# Show available versions
conda search package_name --info
```

## Resolving Conflicts

### Using Alternative Channels
```bash
# Try conda-forge channel
conda install -c conda-forge package_name

# Try different channel order
conda config --prepend channels conda-forge
conda install package_name
```

### Version Specific Installation
```bash
# Install specific version
conda install package_name=1.2.3

# Downgrade package
conda install package_name<2.0
```

## Advanced Resolution

### Environment Approach
```bash
# Create new environment for testing
conda create --name test_env
conda activate test_env
conda install package1 package2

# Export working configuration
conda env export > working_env.yml
```

### Using Mamba
```bash
# Install mamba solver
conda install mamba -c conda-forge

# Resolve with mamba
mamba install package_name
```

## Common Conflict Patterns

### Python Version Conflicts
```bash
# Pin Python version
conda install python=3.9.*

# Rebuild environment with specific Python
conda create --name py39env python=3.9
```

### Package Build Conflicts
```bash
# Try different build
conda install package_name=1.2.3=*

# Force reinstall
conda install --force-reinstall package_name
```

## Prevention Strategies

### Environment Planning
```bash
# Create minimal environments
conda create --name myenv --no-deps
conda install --only-deps package_name

# Use environment files
conda env create -f environment.yml
```

### Channel Management
```bash
# Set channel priority
conda config --set channel_priority strict

# Remove problematic channels
conda config --remove channels channel_name
```

## Emergency Solutions

### Nuclear Option
```bash
# Remove environment and start fresh
conda deactivate
conda env remove --name problem_env
conda create --name fresh_env --file requirements.txt

# Clean all caches
conda clean --all
```

### Conflict Documentation
```bash
# Export environment state
conda list --explicit > package_list.txt
conda env export --no-builds > environment.yml
```