# Introduction to Python

## Table of Contents

- [Why Python?](#why-python)
- [Setting Up Your Environment](#setting-up-your-environment)
- [Running Your First Program](#running-your-first-program)
- [Python vs JavaScript (For JS Developers)](#python-vs-javascript)
- [Python Interactive Shell](#python-interactive-shell)
- [Code Style and Conventions](#code-style-and-conventions)
- [Exercises](#exercises)

## Why Python?

Python is a high-level, interpreted programming language known for its:

- Simple, readable syntax
- Large standard library
- Extensive third-party package ecosystem
- Cross-platform compatibility
- Strong community support
- Versatility across different domains (web, data science, AI, automation)

## Setting Up Your Environment

### 1. Installing Python

1. Visit [python.org](https://python.org)
2. Download the latest stable version (3.x)
3. During installation on Windows, check "Add Python to PATH"

### 2. Verifying Installation

Open terminal/command prompt:

```bash
python --version
# or
python3 --version
```

### 3. Installing an IDE

Recommended options:

- VS Code with Python extension
- PyCharm (Community Edition)
- Jupyter Notebook (for data science)

## Running Your First Program

1. Create a file named `hello.py`:

```python
# This is your first Python program
print("Hello, World!")

# You can also use variables
name = "Python Learner"
print(f"Welcome, {name}!")
```

2. Run from terminal:

```bash
python hello.py
```

## Python vs JavaScript

For JavaScript developers, here's a quick comparison:

### 1. Syntax Differences

```python
# Python
def greet(name):
    return f"Hello, {name}!"

# List comprehension (unique to Python)
numbers = [i * 2 for i in range(5)]

# Python class
class Person:
    def __init__(self, name):
        self.name = name
```

```javascript
// JavaScript
const greet = (name) => {
  return `Hello, ${name}!`;
};

// Array mapping (JS way)
const numbers = Array.from({ length: 5 }, (_, i) => i * 2);

// JavaScript class
class Person {
  constructor(name) {
    this.name = name;
  }
}
```

### 2. Key Differences

- Python uses indentation for blocks; JavaScript uses curly braces
- Python's `None` vs JavaScript's `null`
- Python lists vs JavaScript arrays
- Python dictionaries vs JavaScript objects
- Python uses `snake_case`; JavaScript uses `camelCase`

## Python Interactive Shell

The Python shell (REPL) is a powerful tool for testing code:

```python
>>> 2 + 2
4
>>> name = "Alice"
>>> print(f"Hello, {name}")
Hello, Alice
>>> help(str)  # Get documentation
```

### IPython - Enhanced Interactive Shell

```bash
pip install ipython
ipython
```

Features:

- Tab completion
- History
- Magic commands
- Better error messages

## Code Style and Conventions

Python follows PEP 8 style guide:

1. Naming Conventions:

   - `variable_name` (snake_case)
   - `CONSTANT_NAME` (uppercase)
   - `ClassName` (PascalCase)
   - `function_name` (snake_case)

2. Indentation:

   - Use 4 spaces (not tabs)
   - Maintain consistent indentation

3. Comments:

   ```python
   # Single line comment

   """
   Multi-line comment (docstring)
   Explains the purpose of functions/classes
   """
   ```

## Exercises

### Basic Exercises

1. Print "Hello, World!" to the console
2. Create variables with different data types
3. Use f-strings to format output

### Interactive Exercises

```python
# 1. Create a greeting program
name = input("Enter your name: ")
print(f"Hello, {name}!")

# 2. Basic calculator
num1 = float(input("Enter first number: "))
num2 = float(input("Enter second number: "))
print(f"Sum: {num1 + num2}")
```

### Challenge Exercise

Create a temperature converter (Celsius to Fahrenheit and vice versa):

```python
def convert_temperature():
    choice = input("Convert to (F)ahrenheit or (C)elsius? ").upper()
    temp = float(input("Enter temperature: "))

    if choice == 'F':
        result = (temp * 9/5) + 32
        print(f"{temp}°C is {result}°F")
    elif choice == 'C':
        result = (temp - 32) * 5/9
        print(f"{temp}°F is {result}°C")
    else:
        print("Invalid choice!")

# Test the function
convert_temperature()
```

## Next Steps

- Explore variables and data types in the next module
- Practice using the Python interactive shell
- Try completing the exercises
- Set up your preferred IDE
