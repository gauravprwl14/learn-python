# Conda Performance Tips

## Installation Optimization

### Parallel Downloads
```bash
# Enable parallel downloads
conda config --set concurrent_download_capacity 5
```

### Using Fast Mirrors
```bash
# Add faster mirrors
conda config --prepend channels conda-forge
```

## Solve Speed Optimization

### Using MAMBA
```bash
# Install mamba
conda install mamba -n base -c conda-forge

# Use mamba instead of conda
mamba install package_name
```

### Strict Channel Priority
```bash
conda config --set channel_priority strict
```

## Environment Optimization

### Create Lightweight Environments
```bash
# Create minimal environment
conda create --name minimal_env --no-default-packages python=3.9

# Install only required dependencies
conda install --no-deps package_name
```

### Cache Management
```bash
# Regular cache cleanup
conda clean --all --yes

# Set cache limits
conda config --set auto_clean True
conda config --set auto_clean_interval 7
```

## Network Performance

### Offline Mode
```bash
# Enable offline mode
conda config --set offline true

# Create offline environment
conda create --offline --name myenv
```

### Update Index Optimization
```bash
# Update index cache
conda clean --index-cache

# Force repodata update
conda update --force-repodata
```

## Best Practices

### Environment Size Control
```bash
# Export minimal environment
conda env export --from-history > environment.yml

# Install only specified dependencies
conda env create -f environment.yml --no-deps
```

### Regular Maintenance
```bash
# Weekly maintenance routine
conda clean --all
conda update --all
conda list --revisions
```