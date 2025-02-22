# Conda Environment Management

## Quick Reference

| Operation | Command | Description |
|-----------|---------|-------------|
| Create Environment | `conda create --name myenv python=3.9` | Create new environment with Python |
| Create from YAML | `conda env create -f environment.yml` | Create environment from YAML file |
| Export Environment | `conda env export > environment.yml` | Export environment to YAML |
| Remove Environment | `conda env remove --name myenv` | Delete an environment |
| Clone Environment | `conda create --name newenv --clone existingenv` | Copy existing environment |
| List Dependencies | `conda list` | Show all packages in current env |
| Set Environment Var | `conda env config vars set MY_VAR=value` | Set environment variable |
| Create with Packages | `conda create --name datasci python numpy pandas` | Create env with specific packages |

## Creating Environments

### Create a New Environment
```bash
conda create --name myenv python=3.9
```

### Create Environment from YAML File
```bash
conda env create -f environment.yml
```

### Clone an Existing Environment
```bash
conda create --name newenv --clone existingenv
```

## Managing Environments

### Export Environment to YAML
```bash
conda env export > environment.yml
```

### Export Only Manually Installed Packages
```bash
conda env export --from-history > environment.yml
```

### List Environment Dependencies
```bash
conda list
```

### Remove Environment
```bash
conda env remove --name myenv
```

## Environment Configuration

### Set Environment Variables
```bash
conda env config vars set MY_VAR=value
```

### Install Multiple Python Versions
```bash
conda create --name py39 python=3.9
conda create --name py310 python=3.10
```

## Advanced Environment Options

### Create Environment with Specific Packages
```bash
conda create --name datasci python=3.9 pandas numpy scikit-learn
```

### Create Environment with Specific Channel
```bash
conda create --name myenv python=3.9 --channel conda-forge
```

### Update All Packages in Environment
```bash
conda update --name myenv --all
```

### Create Environment in Specific Location
```bash
conda create --prefix ./envs/myproject python=3.9
```

## Environment Sharing

### Create Requirements File
```bash
conda list --explicit > requirements.txt
```

### Create Environment from Requirements
```bash
conda create --name myenv --file requirements.txt
```

### Cross-Platform Environment Creation
```bash
# Create platform-independent environment file
conda env export --no-builds > environment.yml

# Create from environment file
conda env create -f environment.yml