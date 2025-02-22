#!/bin/bash

# Create basic directory structure
mkdir -p basic advanced

# Create basic level files
cd basic
touch 01_classes_objects.md
touch 02_inheritance.md
touch 03_encapsulation.md
touch 04_polymorphism.md
cd ..

# Create advanced level files
cd advanced
touch 01_metaclasses.md
touch 02_descriptors.md
touch 03_class_decorators.md
touch 04_abstract_classes.md
cd ..

# Create README.md
cat > README.md << 'EOF_README'
# Object-Oriented Programming in Python

This module covers object-oriented programming concepts in Python.

## Basic Concepts
* [Classes and Objects](basic/01_classes_objects.md)
* [Inheritance](basic/02_inheritance.md)
* [Encapsulation](basic/03_encapsulation.md)
* [Polymorphism](basic/04_polymorphism.md)

## Advanced Concepts
* [Metaclasses](advanced/01_metaclasses.md)
* [Descriptors](advanced/02_descriptors.md)
* [Class Decorators](advanced/03_class_decorators.md)
* [Abstract Classes](advanced/04_abstract_classes.md)
EOF_README

echo "OOP module structure created successfully!"
