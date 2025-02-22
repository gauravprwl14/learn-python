# Environment Variables in Conda

## Basic Environment Variables

### Setting Environment Variables
```bash
# Set a single variable
conda env config vars set MY_VAR=value

# Set multiple variables
conda env config vars set MY_VAR1=value1 MY_VAR2=value2
```

### List Environment Variables
```bash
conda env config vars list
```

### Remove Environment Variables
```bash
conda env config vars unset MY_VAR
```

## Common Environment Variables

### Proxy Configuration
```bash
conda env config vars set HTTP_PROXY=http://proxy.example.com:8080
conda env config vars set HTTPS_PROXY=https://proxy.example.com:8080
```

### Path Configuration
```bash
conda env config vars set PYTHONPATH=/custom/path
conda env config vars set LD_LIBRARY_PATH=/usr/local/lib
```

## Environment-Specific Variables

### Development Settings
```bash
conda env config vars set DEBUG=1
conda env config vars set DEVELOPMENT_MODE=true
```

### Production Settings
```bash
conda env config vars set PRODUCTION=true
conda env config vars set LOG_LEVEL=INFO
```

## Temporary Variables

### Set for Current Session
```bash
export TEMP_VAR=value  # Unix/Linux/MacOS
set TEMP_VAR=value    # Windows
```

## Best Practices

### Using .env Files
```bash
# Create .env file
echo "MY_VAR=value" > .env

# Load from .env
set -a; source .env; set +a
```

### Environment Variable Persistence
```bash
# Add to conda environment activation script
mkdir -p $CONDA_PREFIX/etc/conda/activate.d
echo "export MY_VAR=value" > $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
```