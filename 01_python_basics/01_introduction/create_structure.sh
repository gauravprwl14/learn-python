#!/bin/bash

# Create basic directory structure
mkdir -p basic advanced

# Create basic level files
cd basic
touch 01_introduction.md
touch 02_variables_datatypes.md
touch 03_control_flow.md
touch 04_functions.md
cd ..

# Create advanced level files
cd advanced
touch 01_memory_management.md
touch 02_decorators.md
touch 03_context_managers.md
touch 04_generators.md
cd ..

# Create README.md
cat > README.md << 'EOF_README'
# Python Fundamentals

This module covers the fundamental concepts of Python programming.

## Basic Concepts
* [Introduction](basic/01_introduction.md)
* [Variables and Data Types](basic/02_variables_datatypes.md)
* [Control Flow](basic/03_control_flow.md)
* [Functions](basic/04_functions.md)

## Advanced Concepts
* [Memory Management](advanced/01_memory_management.md)
* [Decorators](advanced/02_decorators.md)
* [Context Managers](advanced/03_context_managers.md)
* [Generators](advanced/04_generators.md)
EOF_README

echo "Fundamentals module structure created successfully!"
