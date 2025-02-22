# Variables and Data Types

## Table of Contents

- [Variables in Python](#variables-in-python)
- [Basic Data Types](#basic-data-types)
- [Type Conversion](#type-conversion)
- [Collections](#collections)
- [JavaScript to Python Comparison](#javascript-to-python-comparison)
- [Common Operations](#common-operations)
- [Best Practices](#best-practices)
- [Exercises](#exercises)

## Variables in Python

### Variable Declaration

```python
# Simple variable assignment
name = "Alice"
age = 25
height = 1.75
is_student = True

# Multiple assignment
x, y, z = 1, 2, 3

# Constants (by convention)
MAX_CONNECTIONS = 100
```

### Variable Naming Rules

- Must start with letter or underscore
- Can contain letters, numbers, underscores
- Case-sensitive
- Cannot use Python keywords

```python
# Valid names
user_name = "John"
_private = "Hidden"
UserAge = 25  # Valid but not conventional in Python

# Invalid names
2names = "Invalid"  # Can't start with number
my-name = "Invalid"  # Can't use hyphen
```

## Basic Data Types

### 1. Numbers

```python
# Integers
age = 25
population = 7_800_000_000  # Underscores for readability

# Floating-point numbers
height = 1.75
pi = 3.14159

# Complex numbers
complex_num = 3 + 4j
```

### 2. Strings

```python
# String creation
name = "Alice"
message = 'Hello, World!'
multi_line = """
This is a
multi-line string
"""

# String operations
full_name = "Alice" + " " + "Smith"  # Concatenation
greeting = f"Hello, {name}!"  # f-strings
upper_name = name.upper()  # Methods

# String slicing
text = "Python"
first_char = text[0]      # 'P'
slice_text = text[1:4]    # 'yth'
reverse_text = text[::-1] # 'nohtyP'
```

### 3. Booleans

```python
is_active = True
is_complete = False

# Boolean operations
result = True and False  # False
result = True or False   # True
result = not True       # False
```

### 4. None (Similar to null/undefined in JS)

```python
value = None

# Checking for None
if value is None:
    print("Value is None")
```

## Type Conversion

### Explicit Type Conversion

```python
# String to number
age_str = "25"
age_num = int(age_str)      # 25
price_float = float("19.99") # 19.99

# Number to string
count_str = str(100)        # "100"

# To boolean
bool_value = bool(1)        # True
bool_empty = bool("")       # False
```

## Collections

### 1. Lists (Similar to Arrays in JS)

```python
# List creation
fruits = ["apple", "banana", "orange"]
numbers = list(range(1, 6))  # [1, 2, 3, 4, 5]

# List operations
fruits.append("grape")      # Add item
first_fruit = fruits[0]     # Access item
fruits[1] = "pear"         # Modify item
del fruits[0]              # Delete item

# List comprehension
squares = [x**2 for x in range(5)]  # [0, 1, 4, 9, 16]
```

### 2. Tuples (Immutable Lists)

```python
# Tuple creation
coordinates = (3, 4)
single_item_tuple = (1,)  # Note the comma

# Tuple unpacking
x, y = coordinates
```

### 3. Dictionaries (Similar to Objects in JS)

```python
# Dictionary creation
person = {
    "name": "Alice",
    "age": 25,
    "city": "New York"
}

# Dictionary operations
name = person["name"]     # Access value
person["email"] = "alice@example.com"  # Add/modify
del person["city"]       # Delete

# Dictionary methods
keys = person.keys()
values = person.values()
items = person.items()
```

## JavaScript to Python Comparison

```javascript
// JavaScript
let array = [1, 2, 3];
array.push(4);
array.pop();

const object = {
  name: "John",
  sayHello() {
    console.log(`Hello, ${this.name}!`);
  },
};
```

```python
# Python
array = [1, 2, 3]
array.append(4)    # Instead of push
array.pop()        # pop is similar

class Object:
    def __init__(self):
        self.name = 'John'

    def say_hello(self):
        print(f"Hello, {self.name}!")
```

## Common Operations

### String Operations

```python
text = "Python Programming"

# String methods
length = len(text)           # Length
lower_text = text.lower()    # Lowercase
words = text.split()         # Split into list
joined = " ".join(words)     # Join list into string
stripped = text.strip()      # Remove whitespace
replaced = text.replace("Python", "Java")  # Replace
```

### Number Operations

```python
import math

# Basic arithmetic
sum_result = 5 + 3
difference = 10 - 4
product = 6 * 7
quotient = 15 / 3      # Returns float
integer_division = 15 // 3  # Returns integer
remainder = 17 % 5
power = 2 ** 3

# Math module
sqrt = math.sqrt(16)
pi = math.pi
ceil = math.ceil(3.7)
floor = math.floor(3.7)
```

## Best Practices

1. Variable Naming

```python
# Good
user_name = "Alice"
total_count = 0
is_active = True

# Bad
a = "Alice"      # Too vague
userName = "Bob"  # Not Python convention
```

2. Type Hints (Python 3.5+)

```python
from typing import List, Dict

def greet(name: str) -> str:
    return f"Hello, {name}!"

numbers: List[int] = [1, 2, 3]
user: Dict[str, str] = {"name": "Alice"}
```

## Exercises

### Basic Exercises

1. Create variables of each basic data type
2. Perform string operations (concatenation, slicing)
3. Create and manipulate lists and dictionaries

### Practice Problems

```python
# 1. String manipulation
def reverse_string(text: str) -> str:
    return text[::-1]

# 2. List operations
def find_unique_numbers(numbers: List[int]) -> List[int]:
    return list(set(numbers))

# 3. Dictionary manipulation
def merge_dicts(dict1: Dict, dict2: Dict) -> Dict:
    return {**dict1, **dict2}
```

### Challenge Exercise

Create a simple address book using dictionaries:

```python
def create_address_book():
    address_book = {}

    while True:
        name = input("Enter name (or 'quit' to exit): ")
        if name.lower() == 'quit':
            break

        email = input("Enter email: ")
        phone = input("Enter phone: ")

        address_book[name] = {
            "email": email,
            "phone": phone
        }

    return address_book

# Test the function
contacts = create_address_book()
print("Address Book:", contacts)
```

## Next Steps

- Practice type conversions
- Experiment with different string operations
- Create more complex data structures
- Move on to control flow in the next module
