#!/bin/bash

# Create basic directory structure
mkdir -p basic advanced

# Create basic level files
cd basic
touch 01_lists_tuples.md
touch 02_dictionaries.md
touch 03_sets.md
touch 04_strings.md
cd ..

# Create advanced level files
cd advanced
touch 01_custom_collections.md
touch 02_binary_trees.md
touch 03_graphs.md
touch 04_algorithms.md
cd ..

# Create README.md
cat > README.md << 'EOF_README'
# Python Data Structures

This module covers Python data structures and algorithms.

## Basic Concepts
* [Lists and Tuples](basic/01_lists_tuples.md)
* [Dictionaries](basic/02_dictionaries.md)
* [Sets](basic/03_sets.md)
* [Strings](basic/04_strings.md)

## Advanced Concepts
* [Custom Collections](advanced/01_custom_collections.md)
* [Binary Trees](advanced/02_binary_trees.md)
* [Graphs](advanced/03_graphs.md)
* [Algorithms](advanced/04_algorithms.md)
EOF_README

echo "Data Structures module structure created successfully!"
