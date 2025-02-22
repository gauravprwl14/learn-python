#!/bin/bash

# Create main course directory
mkdir -p python-course
cd python-course

# Create main README.md
cat > README.md << 'EOF'
# Python Learning Path

A comprehensive Python learning course covering basic to advanced concepts.

## Course Structure

1. [Fundamentals](01_fundamentals/README.md)
2. [Object-Oriented Programming](02_oop/README.md)
3. [Data Structures](03_data_structures/README.md)
4. [Advanced Concepts](04_advanced_concepts/README.md)

## How to Use This Course

1. Each module contains both basic and advanced concepts
2. Start with the basic concepts in each module
3. Progress to advanced concepts once basics are mastered
4. Complete exercises and projects in each section

## Module Overview

### 1. Fundamentals
- Basic: Python basics, variables, control flow, functions
- Advanced: Memory management, decorators, generators

### 2. Object-Oriented Programming
- Basic: Classes, inheritance, encapsulation
- Advanced: Metaclasses, descriptors, abstract classes

### 3. Data Structures
- Basic: Lists, dictionaries, sets, strings
- Advanced: Custom collections, trees, graphs

### 4. Advanced Concepts
- Basic: Modules, file handling, error handling
- Advanced: Multithreading, async programming, design patterns
EOF

# Create module directories and their create_structure.sh scripts
declare -a modules=(
    "01_fundamentals"
    "02_oop"
    "03_data_structures"
    "04_advanced_concepts"
)

for module in "${modules[@]}"; do
    mkdir -p "$module"
    
    # Create module-specific create_structure.sh
    case "$module" in
        "01_fundamentals")
            cat > "$module/create_structure.sh" << 'EOF'
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
EOF
            ;;
            
        "02_oop")
            cat > "$module/create_structure.sh" << 'EOF'
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
EOF
            ;;
            
        "03_data_structures")
            cat > "$module/create_structure.sh" << 'EOF'
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
EOF
            ;;
            
        "04_advanced_concepts")
            cat > "$module/create_structure.sh" << 'EOF'
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
EOF
            ;;
    esac
    
    # Make the module's create_structure.sh executable
    chmod +x "$module/create_structure.sh"
    
    # Execute the module's create_structure.sh
    cd "$module"
    ./create_structure.sh
    cd ..
done

echo "Complete course structure created successfully!"