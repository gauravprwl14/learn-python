# Common Conda Workflows

## Data Science Project Setup

### Initial Setup
```bash
# Create data science environment
conda create --name ds_project python=3.9
conda activate ds_project

# Install essential packages
conda install pandas numpy matplotlib scikit-learn jupyter

# Create environment file
conda env export > environment.yml
```

## Machine Learning Project

### GPU Environment Setup
```bash
# Create ML environment with GPU support
conda create --name ml_project python=3.9
conda activate ml_project

# Install ML frameworks
conda install tensorflow-gpu pytorch torchvision cudatoolkit
conda install -c conda-forge optuna mlflow
```

## Web Development

### Django Setup
```bash
# Create web development environment
conda create --name web_dev python=3.9
conda activate web_dev

# Install web packages
conda install django djangorestframework
conda install -c conda-forge pre-commit black flake8
```

## Team Collaboration

### Sharing Environments
```bash
# Export environment without builds
conda env export --no-builds > shared_env.yml

# Create from shared environment
conda env create -f shared_env.yml

# Update existing environment
conda env update -f shared_env.yml
```

## Production Deployment

### Creating Production Environment
```bash
# Create minimal production environment
conda create --name prod_env --no-deps python=3.9
conda activate prod_env

# Install only required packages
conda install --only-deps --file requirements.txt

# Lock dependencies
conda list --explicit > prod_requirements.txt
```

## Development Workflow

### Testing Environment
```bash
# Create testing environment
conda create --name test_env python=3.9
conda activate test_env

# Install testing packages
conda install pytest pytest-cov
conda install -c conda-forge black isort mypy
```

## Package Development

### Development Setup
```bash
# Create development environment
conda create --name pkg_dev python=3.9
conda activate pkg_dev

# Install development tools
conda install build twine setuptools
conda install -c conda-forge pytest-runner
```

## Maintenance Workflows

### Weekly Maintenance
```bash
# Update base environment
conda update -n base conda

# Update all packages
conda update --all

# Clean unused packages
conda clean --all
```

## Migration Workflow

### Moving to New System
```bash
# Export current setup
conda env export > full_env.yml
conda list --explicit > exact_env.txt

# Recreate on new system
conda env create -f full_env.yml
# OR for exact reproduction
conda create --name new_env --file exact_env.txt
```