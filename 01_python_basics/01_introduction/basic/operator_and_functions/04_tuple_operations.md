# Tuple Operations in Python

## Table of Contents

- [Tuple Basics](#tuple-basics)
- [Creation and Conversion](#creation-and-conversion)
- [Tuple Operations](#tuple-operations)
- [Tuple Methods](#tuple-methods)
- [Named Tuples](#named-tuples)
- [Common Use Cases](#common-use-cases)
- [Performance Advantages](#performance-advantages)
- [Best Practices](#best-practices)

## Tuple Basics

### Key Characteristics

- Immutable: Cannot be modified after creation
- Ordered: Elements maintain their order
- Allow duplicates
- Can contain different data types
- Hashable (if elements are hashable)

### Tuple vs List Comparison

| Aspect       | Tuple                      | List                    |
| ------------ | -------------------------- | ----------------------- |
| Mutability   | Immutable                  | Mutable                 |
| Syntax       | `()`                       | `[]`                    |
| Memory Usage | Less                       | More                    |
| Performance  | Faster                     | Slower                  |
| Use Case     | Data grouping              | Collection manipulation |
| Hash Support | Hashable (if elements are) | Not hashable            |

## Creation and Conversion

### Creation Methods

| Method              | Example            | Result      | Notes          |
| ------------------- | ------------------ | ----------- | -------------- |
| Parentheses         | `(1, 2, 3)`        | `(1, 2, 3)` | Standard way   |
| No Parentheses      | `1, 2, 3`          | `(1, 2, 3)` | Tuple packing  |
| Single Element      | `(1,)`             | `(1,)`      | Comma required |
| Empty Tuple         | `()` or `tuple()`  | `()`        | Both work      |
| tuple() Constructor | `tuple([1, 2, 3])` | `(1, 2, 3)` | From iterable  |

```python
# Different creation methods
empty_tuple = ()
single_item = (1,)
multiple_items = (1, 2, 3)
mixed_types = (1, "hello", True)

# Tuple packing
coordinates = 3, 4
name_age = "John", 30

# From iterables
from_list = tuple([1, 2, 3])
from_string = tuple("hello")  # ('h', 'e', 'l', 'l', 'o')
```

### Type Conversion

```python
# To tuple
list_to_tuple = tuple([1, 2, 3])
set_to_tuple = tuple({1, 2, 3})
str_to_tuple = tuple("hello")

# From tuple
tuple_to_list = list((1, 2, 3))
tuple_to_set = set((1, 2, 3))
```

## Tuple Operations

### Basic Operators

| Operator | Description    | Example              | Result         |
| -------- | -------------- | -------------------- | -------------- |
| `+`      | Concatenation  | `(1, 2) + (3, 4)`    | `(1, 2, 3, 4)` |
| `*`      | Repetition     | `(1, 2) * 2`         | `(1, 2, 1, 2)` |
| `in`     | Membership     | `1 in (1, 2, 3)`     | `True`         |
| `not in` | Non-membership | `4 not in (1, 2, 3)` | `True`         |
| `==`     | Equality       | `(1, 2) == (1, 2)`   | `True`         |
| `<`, `>` | Comparison     | `(1, 2) < (1, 3)`    | `True`         |
| `[]`     | Indexing       | `(1, 2, 3)[1]`       | `2`            |
| `[:]`    | Slicing        | `(1, 2, 3)[1:]`      | `(2, 3)`       |

### Examples of Operations

```python
# Concatenation
t1 = (1, 2)
t2 = (3, 4)
combined = t1 + t2  # (1, 2, 3, 4)

# Repetition
repeated = t1 * 3  # (1, 2, 1, 2, 1, 2)

# Indexing and Slicing
items = (0, 1, 2, 3, 4, 5)
print(items[2])     # 2
print(items[-1])    # 5
print(items[2:4])   # (2, 3)
print(items[::2])   # (0, 2, 4)
```

## Tuple Methods

### Available Methods

| Method    | Description       | Example              | Result |
| --------- | ----------------- | -------------------- | ------ |
| `count()` | Count occurrences | `(1,2,2,3).count(2)` | `2`    |
| `index()` | Find first index  | `(1,2,2,3).index(2)` | `1`    |

```python
# Method examples
numbers = (1, 2, 2, 3, 2, 4)
count_2 = numbers.count(2)    # 3
index_2 = numbers.index(2)    # 1
index_2_start = numbers.index(2, 2)  # 2 (start from index 2)
```

## Named Tuples

### Using collections.namedtuple

```python
from collections import namedtuple

# Creating named tuple class
Point = namedtuple('Point', ['x', 'y'])
Person = namedtuple('Person', 'name age')  # Space-separated string also works

# Creating instances
p = Point(3, 4)
john = Person('John', 30)

# Accessing values
print(p.x)          # 3
print(john.name)    # 'John'

# Converting to dictionary
p_dict = p._asdict()  # {'x': 3, 'y': 4}

# Creating new instance with changes
p2 = p._replace(x=5)  # Point(x=5, y=4)
```

### Named Tuple Features

```python
# Default values
Employee = namedtuple('Employee', ['name', 'salary'], defaults=['Unknown', 0])
emp1 = Employee()  # Employee(name='Unknown', salary=0)

# Field renaming
# Handles duplicate or invalid field names
Point = namedtuple('Point', ['x', 'x', 'class'], rename=True)
# Results in ['x', '_1', '_2']

# Additional methods
Point._fields  # ('x', 'y')
Point._field_defaults  # {}
```

## Common Use Cases

### 1. Return Multiple Values

```python
def get_coordinates():
    return (3, 4)  # Implicit tuple

def get_user_info():
    return 'John', 30, 'New York'  # Tuple packing

# Unpacking
x, y = get_coordinates()
name, age, city = get_user_info()
```

### 2. Data Grouping

```python
# Representing fixed data structures
RGB = namedtuple('RGB', ['red', 'green', 'blue'])
color = RGB(100, 150, 200)

# Database records
Record = namedtuple('Record', ['id', 'title', 'date'])
records = [
    Record(1, 'First', '2024-01-01'),
    Record(2, 'Second', '2024-01-02')
]
```

### 3. Dictionary Keys

```python
# Tuple as dictionary key
locations = {
    (40.7128, -74.0060): 'New York',
    (51.5074, -0.1278): 'London'
}

# Lookup
def get_city(lat, lon):
    return locations.get((lat, lon), 'Unknown')
```

### 4. Data Integrity

```python
def process_user_data(user_tuple):
    # Tuple ensures data won't be modified
    name, age = user_tuple
    return f"{name} is {age} years old"

# Configuration constants
CONFIG = (
    ('DEBUG', True),
    ('API_KEY', 'secret'),
    ('MAX_CONNECTIONS', 100)
)
```

## Performance Advantages

### Memory Usage

```python
import sys

# Compare memory usage
list_example = [1, 2, 3, 4, 5]
tuple_example = (1, 2, 3, 4, 5)

print(sys.getsizeof(list_example))   # Larger
print(sys.getsizeof(tuple_example))  # Smaller
```

### Performance Testing

```python
import timeit

# Creation performance
list_creation = timeit.timeit('x = [1, 2, 3, 4, 5]', number=1000000)
tuple_creation = timeit.timeit('x = (1, 2, 3, 4, 5)', number=1000000)

# Access performance
tuple_access = timeit.timeit('x = (1, 2, 3, 4, 5); y = x[2]', number=1000000)
list_access = timeit.timeit('x = [1, 2, 3, 4, 5]; y = x[2]', number=1000000)
```

## Best Practices

### 1. Use Cases for Tuples

```python
# Good - Immutable data
MONTHS = ('Jan', 'Feb', 'Mar', ...)
COORDINATES = (latitude, longitude)

# Bad - Data that needs modification
user_scores = (98, 95, 92)  # Use list instead if scores need updating
```

### 2. Tuple Unpacking

```python
# Good - Clear unpacking
name, age, city = person_tuple

# Better - With descriptive variables
latitude, longitude = location_tuple

# Best - Using named tuples
user = UserInfo(name='John', age=30, city='New York')
```

### 3. Error Handling

```python
def safe_tuple_access(tup, index):
    try:
        return tup[index]
    except IndexError:
        return None

def safe_tuple_unpacking(tup, expected_size):
    if len(tup) != expected_size:
        raise ValueError(f"Expected tuple of size {expected_size}")
    return tup
```

Remember:

- Use tuples for immutable data collections
- Prefer named tuples for semantic clarity
- Use tuple unpacking for multiple return values
- Consider tuples for dictionary keys
- Take advantage of tuple's performance benefits
- Use lists when data needs to be modified
