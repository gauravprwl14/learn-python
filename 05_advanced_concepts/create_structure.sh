#!/bin/bash

# Create basic directory structure
mkdir -p basic advanced

# Create basic level files
cd basic
touch 01_modules_packages.md
touch 02_file_handling.md
touch 03_error_handling.md
touch 04_testing.md
cd ..

# Create advanced level files
cd advanced
touch 01_multithreading.md
touch 02_multiprocessing.md
touch 03_async_programming.md
touch 04_design_patterns.md
cd ..

# Create README.md
cat > README.md << 'EOF_README'
# Advanced Python Concepts

This module covers advanced Python programming concepts.

## Basic Concepts
* [Modules and Packages](basic/01_modules_packages.md)
* [File Handling](basic/02_file_handling.md)
* [Error Handling](basic/03_error_handling.md)
* [Testing](basic/04_testing.md)

## Advanced Concepts
* [Multithreading](advanced/01_multithreading.md)
* [Multiprocessing](advanced/02_multiprocessing.md)
* [Async Programming](advanced/03_async_programming.md)
* [Design Patterns](advanced/04_design_patterns.md)
EOF_README

echo "Advanced Concepts module structure created successfully!"
