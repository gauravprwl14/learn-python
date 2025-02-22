# Common Python Operators and Functions

## Table of Contents

- [Operators](#operators)
  - [Membership Operators](#membership-operators)
  - [Identity Operators](#identity-operators)
  - [Sequence Operators](#sequence-operators)
  - [Logical Operators](#logical-operators)
- [Built-in Functions](#built-in-functions)
  - [Sequence Functions](#sequence-functions)
  - [Numeric Functions](#numeric-functions)
  - [Type Conversion Functions](#type-conversion-functions)
  - [Iterator Functions](#iterator-functions)
- [String Operations](#string-operations)
- [List Operations](#list-operations)
- [Dictionary Operations](#dictionary-operations)
- [Best Practices](#best-practices)

## Operators

### Membership Operators

1. **in operator**: Used to test if a sequence contains a value

```python
# List membership
fruits = ['apple', 'banana', 'orange']
print('apple' in fruits)  # True
print('grape' in fruits)  # False

# String membership
text = "Hello, World!"
print('H' in text)       # True
print('x' in text)       # False

# Dictionary key membership
person = {'name': 'John', 'age': 30}
print('name' in person)  # True
print('email' in person) # False

# Practical use in conditionals
def process_fruit(fruit):
    allowed_fruits = {'apple', 'banana', 'orange'}
    if fruit.lower() in allowed_fruits:
        return f"Processing {fruit}"
    return f"Unknown fruit: {fruit}"
```

2. **not in operator**: Opposite of 'in'

```python
# Validation example
def validate_username(username):
    forbidden_chars = ' !@#$%^&*()'
    return all(char not in forbidden_chars for char in username)

# Error checking
def safe_divide(a, b):
    if b not in [0, 0.0]:
        return a / b
    raise ValueError("Cannot divide by zero")
```

### Identity Operators

1. **is operator**: Tests if two objects are the same object in memory

```python
# List identity
a = [1, 2, 3]
b = [1, 2, 3]
c = a

print(a is b)  # False (different objects with same values)
print(a is c)  # True (same object)

# None checking (preferred way)
def process_value(value):
    if value is None:
        return "No value provided"
    return f"Processing: {value}"

# Singleton pattern example
class Singleton:
    _instance = None

    @classmethod
    def get_instance(cls):
        if cls._instance is None:
            cls._instance = cls()
        return cls._instance
```

2. **is not operator**: Opposite of 'is'

```python
# Type checking example
def ensure_list(value):
    if value is not None:
        return value if isinstance(value, list) else [value]
    return []
```

### Sequence Operators

1. **range()**: Creates a sequence of numbers

```python
# Basic range usage
for i in range(5):
    print(i)  # 0, 1, 2, 3, 4

# Range with start and end
for i in range(2, 5):
    print(i)  # 2, 3, 4

# Range with step
for i in range(0, 10, 2):
    print(i)  # 0, 2, 4, 6, 8

# Practical examples
def create_matrix(size):
    return [[0 for _ in range(size)] for _ in range(size)]

def process_every_nth(items, n):
    return [items[i] for i in range(0, len(items), n)]
```

2. **slice operator**: Used for sequence slicing

```python
# Basic slicing
items = [0, 1, 2, 3, 4, 5]
print(items[2:4])    # [2, 3]
print(items[:3])     # [0, 1, 2]
print(items[3:])     # [3, 4, 5]
print(items[::2])    # [0, 2, 4]
print(items[::-1])   # [5, 4, 3, 2, 1, 0]

# Practical slice examples
def get_file_extension(filename):
    return filename[filename.rfind('.'):]

def paginate(items, page_size):
    """Divide items into pages"""
    for i in range(0, len(items), page_size):
        yield items[i:i + page_size]
```

## Built-in Functions

### Sequence Functions

1. **len()**: Returns the length of a sequence

```python
# Basic usage
text = "Hello"
print(len(text))  # 5

# With different types
print(len([1, 2, 3]))  # 3
print(len({'a': 1, 'b': 2}))  # 2

# Practical use
def is_valid_password(password):
    return len(password) >= 8

def chunk_data(data, chunk_size):
    return [data[i:i+chunk_size]
            for i in range(0, len(data), chunk_size)]
```

2. **enumerate()**: Iterate with index and value

```python
# Basic usage
fruits = ['apple', 'banana', 'orange']
for i, fruit in enumerate(fruits):
    print(f"{i}: {fruit}")

# With start index
for i, fruit in enumerate(fruits, start=1):
    print(f"Fruit #{i}: {fruit}")

# Practical example
def find_all_indices(items, value):
    return [i for i, item in enumerate(items) if item == value]

def create_indexed_dict(items):
    return {f"item_{i}": item for i, item in enumerate(items, 1)}
```

3. **zip()**: Combine multiple iterables

```python
# Basic usage
names = ['Alice', 'Bob', 'Charlie']
ages = [25, 30, 35]
for name, age in zip(names, ages):
    print(f"{name} is {age} years old")

# Creating dictionaries
keys = ['a', 'b', 'c']
values = [1, 2, 3]
dict_from_zip = dict(zip(keys, values))

# Practical example
def merge_lists(list1, list2):
    """Merge two lists into list of tuples"""
    return list(zip(list1, list2))

def combine_data(*lists):
    """Combine multiple lists element-wise"""
    return [sum(items) for items in zip(*lists)]
```

### Numeric Functions

1. **sum()**: Sum of items in iterable

```python
# Basic usage
numbers = [1, 2, 3, 4, 5]
total = sum(numbers)  # 15

# With start value
total_plus_10 = sum(numbers, 10)  # 25

# Practical examples
def calculate_average(numbers):
    return sum(numbers) / len(numbers) if numbers else 0

def total_purchase(items):
    return sum(item['price'] for item in items)
```

2. **max()/min()**: Find maximum/minimum values

```python
# Basic usage
numbers = [1, 5, 2, 8, 3]
print(max(numbers))  # 8
print(min(numbers))  # 1

# With key function
words = ['cat', 'elephant', 'dog']
longest = max(words, key=len)  # 'elephant'
shortest = min(words, key=len) # 'cat'

# Practical example
def find_best_score(students):
    return max(students, key=lambda s: s['score'])

def get_price_range(products):
    prices = [p['price'] for p in products]
    return {'min': min(prices), 'max': max(prices)}
```

### Iterator Functions

1. **map()**: Apply function to every item

```python
# Basic usage
numbers = [1, 2, 3, 4, 5]
squares = list(map(lambda x: x**2, numbers))

# With multiple iterables
a = [1, 2, 3]
b = [10, 20, 30]
sums = list(map(lambda x, y: x + y, a, b))

# Practical example
def process_user_data(users):
    def format_user(user):
        return {
            'name': user['name'].strip().title(),
            'email': user['email'].lower()
        }
    return list(map(format_user, users))
```

2. **filter()**: Filter items based on function

```python
# Basic usage
numbers = [1, 2, 3, 4, 5, 6]
evens = list(filter(lambda x: x % 2 == 0, numbers))

# Complex filtering
def is_valid_user(user):
    return (user.get('email') and
            user.get('name') and
            len(user['name']) >= 2)

valid_users = list(filter(is_valid_user, users))

# Practical example
def get_active_items(items):
    return list(filter(lambda x: x['status'] == 'active', items))
```

## String Operations

1. **String methods**

```python
# Common string operations
text = "  Hello, World!  "
print(text.strip())          # "Hello, World!"
print(text.lower())          # "  hello, world!  "
print(text.upper())          # "  HELLO, WORLD!  "
print(text.replace(',', '')) # "  Hello World!  "

# Splitting and joining
words = text.split()         # ['Hello,', 'World!']
joined = '-'.join(words)     # "Hello,-World!"

# Practical example
def clean_text(text):
    """Clean and normalize text"""
    return text.strip().lower().replace(',', '')

def parse_csv_line(line):
    """Parse CSV line with custom delimiter"""
    return [field.strip() for field in line.split(',')]
```

## List Operations

1. **List comprehensions**

```python
# Basic list comprehension
numbers = [1, 2, 3, 4, 5]
squares = [x**2 for x in numbers]

# With condition
evens = [x for x in numbers if x % 2 == 0]

# Nested comprehension
matrix = [[i+j for j in range(3)] for i in range(3)]

# Practical example
def extract_emails(users):
    return [user['email'] for user in users
            if 'email' in user]

def create_matrix(rows, cols, default=0):
    return [[default for _ in range(cols)]
            for _ in range(rows)]
```

## Dictionary Operations

1. **Dictionary comprehensions**

```python
# Basic dictionary comprehension
squares = {x: x**2 for x in range(5)}

# Filtering with comprehension
even_squares = {x: x**2 for x in range(5) if x % 2 == 0}

# Practical example
def create_lookup(items, key_func):
    return {key_func(item): item for item in items}

def group_by_type(items):
    return {type_: [item for item in items
                   if item['type'] == type_]
            for type_ in set(item['type'] for item in items)}
```

## Best Practices

1. **Use list comprehensions wisely**

```python
# Good - Simple comprehension
squares = [x**2 for x in numbers]

# Bad - Too complex, use regular loop instead
result = [x*y for x in range(10)
          for y in range(10)
          if x % 2 == 0
          if y % 2 == 0]
```

2. **Choose appropriate operators**

```python
# Good - Using 'is' for None
if value is None:
    pass

# Bad - Using == for None
if value == None:
    pass

# Good - Using 'in' for membership
if user_type in {'admin', 'manager'}:
    pass

# Bad - Using multiple OR conditions
if user_type == 'admin' or user_type == 'manager':
    pass
```

3. **Optimize operations**

```python
# Good - Using set for membership testing
valid_types = {'A', 'B', 'C'}
if type_ in valid_types:
    pass

# Bad - Using list for membership testing
valid_types = ['A', 'B', 'C']
if type_ in valid_types:
    pass

# Good - Using dict.get() with default
value = data.get('key', default_value)

# Bad - Using explicit check
value = default_value if 'key' not in data else data['key']
```

Remember:

- Choose the right operator for the task
- Use built-in functions when available
- Consider performance implications
- Keep code readable and maintainable
- Use type hints for better code clarity
