# Conda Memory Management

## Cache Management

### Clear Package Cache
```bash
# Remove unused package cache
conda clean --packages

# Remove index cache
conda clean --index-cache

# Remove all caches
conda clean --all
```

### Temporary Files Cleanup
```bash
conda clean --tempfiles
```

## Memory Optimization

### Minimize Environment Size
```bash
# Export only necessary packages
conda env export --from-history > environment.yml

# Create minimal environment
conda create --name minimal --only-deps package_name
```

### Package Cache Control
```bash
# Set cache size limit (in GB)
conda config --set pkgs_dirs.max_size_gb 5

# Disable package caching
conda config --set pkgs_dirs.max_size_gb 0
```

## Memory-Efficient Installation

### Install without Dependencies
```bash
conda install --no-deps package_name
```

### Download Only
```bash
conda install --download-only package_name
```

## Best Practices

### Regular Maintenance
```bash
# Weekly cleanup script
conda clean --all
conda list --revisions
conda remove --revision 1
```

### Environment Size Monitoring
```bash
du -sh ~/anaconda3/envs/*
du -sh ~/anaconda3/pkgs
```