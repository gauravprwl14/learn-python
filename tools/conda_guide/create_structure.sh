# Create main directory structure
mkdir -p tools/conda_guide/{basics,advanced,examples,troubleshooting}
mkdir -p tools/conda_guide/examples/{environments,workflows}
mkdir -p tools/conda_guide/basics/{installation,commands}
mkdir -p tools/conda_guide/advanced/{optimization,configuration}
mkdir -p tools/conda_guide/troubleshooting/common_issues

# Create documentation files
touch tools/conda_guide/README.md
touch tools/conda_guide/CONTRIBUTING.md
touch tools/conda_guide/bash_commands.md
touch tools/conda_guide/cheatsheet.md

# Create basic guide files
touch tools/conda_guide/basics/installation/README.md
touch tools/conda_guide/basics/installation/install_guide.md
touch tools/conda_guide/basics/commands/basic_commands.md
touch tools/conda_guide/basics/commands/package_management.md
touch tools/conda_guide/basics/commands/environment_management.md

# Create advanced guide files
touch tools/conda_guide/advanced/optimization/performance_tips.md
touch tools/conda_guide/advanced/optimization/memory_management.md
touch tools/conda_guide/advanced/configuration/channel_config.md
touch tools/conda_guide/advanced/configuration/env_variables.md

# Create example files
touch tools/conda_guide/examples/environments/data_science.yml
touch tools/conda_guide/examples/environments/web_dev.yml
touch tools/conda_guide/examples/environments/ml_env.yml
touch tools/conda_guide/examples/workflows/common_workflows.md
touch tools/conda_guide/examples/workflows/production_setup.md

# Create troubleshooting files
touch tools/conda_guide/troubleshooting/common_issues/installation_issues.md
touch tools/conda_guide/troubleshooting/common_issues/package_conflicts.md
touch tools/conda_guide/troubleshooting/common_issues/environment_problems.md 