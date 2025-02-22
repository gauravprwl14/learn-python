# Dictionary Operations in Python

## Table of Contents

- [Basic Dictionary Operations](#basic-dictionary-operations)
- [Dictionary Methods](#dictionary-methods)
- [Dictionary Views](#dictionary-views)
- [Dictionary Comprehensions](#dictionary-comprehensions)
- [Nested Dictionaries](#nested-dictionaries)
- [Common Patterns](#common-patterns)
- [Advanced Operations](#advanced-operations)
- [Performance Considerations](#performance-considerations)
- [Best Practices](#best-practices)

## Basic Dictionary Operations

### Creation Methods

| Method      | Example                       | Result             | Notes                   |
| ----------- | ----------------------------- | ------------------ | ----------------------- |
| Literal     | `{'a': 1, 'b': 2}`            | `{'a': 1, 'b': 2}` | Direct creation         |
| Constructor | `dict(a=1, b=2)`              | `{'a': 1, 'b': 2}` | Using keywords          |
| From pairs  | `dict([('a',1), ('b',2)])`    | `{'a': 1, 'b': 2}` | From iterable of pairs  |
| From keys   | `dict.fromkeys(['a','b'], 0)` | `{'a': 0, 'b': 0}` | Initialize with default |
| Copy        | `original.copy()`             | Shallow copy       | New reference           |

```python
# Different creation methods
empty_dict = {}
literal_dict = {'name': 'John', 'age': 30}
keyword_dict = dict(name='John', age=30)
pairs_dict = dict([('name', 'John'), ('age', 30)])

# From two lists
keys = ['a', 'b', 'c']
values = [1, 2, 3]
combined_dict = dict(zip(keys, values))

# Dictionary with default values
default_dict = dict.fromkeys(['a', 'b', 'c'], 0)
```

### Basic Operators

| Operator | Description        | Example          | Result       |
| -------- | ------------------ | ---------------- | ------------ |
| `[]`     | Access/Set item    | `d['key']`       | Value at key |
| `in`     | Key membership     | `'key' in d`     | Boolean      |
| `not in` | Key non-membership | `'key' not in d` | Boolean      |
| `==`     | Equality           | `d1 == d2`       | Boolean      |
| `\|`     | Merge (3.9+)       | `d1 \| d2`       | Merged dict  |
| `\|=`    | Update (3.9+)      | `d1 \|= d2`      | Update d1    |

## Dictionary Methods

### Access Methods

| Method                      | Description            | Example                  | Result            |
| --------------------------- | ---------------------- | ------------------------ | ----------------- |
| `get(key[,default])`        | Safe access            | `d.get('key', 0)`        | Value or default  |
| `setdefault(key[,default])` | Get or set default     | `d.setdefault('key', 0)` | Value or default  |
| `pop(key[,default])`        | Remove and return      | `d.pop('key', None)`     | Value or default  |
| `popitem()`                 | Remove and return last | `d.popitem()`            | (key, value) pair |

### Modification Methods

| Method     | Description      | Example              | Notes             |
| ---------- | ---------------- | -------------------- | ----------------- |
| `update()` | Update/add items | `d.update({'a': 1})` | Modifies in place |
| `clear()`  | Remove all items | `d.clear()`          | Empty dictionary  |
| `copy()`   | Shallow copy     | `d.copy()`           | New dictionary    |

### View Methods

| Method     | Description     | Example      | Result Type |
| ---------- | --------------- | ------------ | ----------- |
| `keys()`   | Get keys view   | `d.keys()`   | dict_keys   |
| `values()` | Get values view | `d.values()` | dict_values |
| `items()`  | Get items view  | `d.items()`  | dict_items  |

```python
# Method examples
data = {'name': 'John', 'age': 30}

# Safe access
name = data.get('name', 'Unknown')
score = data.get('score', 0)  # Default if key missing

# Modification
data.update({'score': 100, 'city': 'New York'})
removed_age = data.pop('age')
last_item = data.popitem()  # Returns and removes last item

# Views
keys = data.keys()
values = data.values()
items = data.items()
```

## Dictionary Views

### Working with Views

```python
# Dynamic views
data = {'a': 1, 'b': 2}
keys_view = data.keys()
values_view = data.values()
items_view = data.items()

# Views update automatically
data['c'] = 3
print(keys_view)    # dict_keys(['a', 'b', 'c'])
print(values_view)  # dict_values([1, 2, 3])
print(items_view)   # dict_items([('a', 1), ('b', 2), ('c', 3)])

# Set operations on views
dict1 = {'a': 1, 'b': 2}
dict2 = {'b': 2, 'c': 3}

# Find common keys
common_keys = dict1.keys() & dict2.keys()
```

## Dictionary Comprehensions

### Basic Patterns

```python
# Simple dict comprehension
squares = {x: x**2 for x in range(5)}

# With condition
even_squares = {x: x**2 for x in range(10) if x % 2 == 0}

# Key-value transformation
names = ['John', 'Jane']
name_lengths = {name: len(name) for name in names}

# From another dict
prices = {'apple': 0.5, 'banana': 0.3, 'orange': 0.6}
discounted = {k: v*0.9 for k, v in prices.items()}
```

### Advanced Patterns

```python
# Multiple if conditions
filtered = {k: v for k, v in data.items()
           if v > 0 if k.startswith('a')}

# Nested dict comprehension
matrix = {i: {j: i*j for j in range(3)}
         for i in range(3)}

# Combining dictionaries
combined = {k: v for d in [dict1, dict2]
           for k, v in d.items()}
```

## Nested Dictionaries

### Working with Nested Structures

```python
# Creating nested dictionaries
users = {
    'john': {
        'age': 30,
        'city': 'New York',
        'scores': {'math': 90, 'english': 85}
    },
    'jane': {
        'age': 25,
        'city': 'Boston',
        'scores': {'math': 95, 'english': 92}
    }
}

# Safe access to nested values
def get_nested(dict_obj, path, default=None):
    """Access nested dictionary values safely."""
    current = dict_obj
    for key in path:
        if not isinstance(current, dict):
            return default
        current = current.get(key, default)
    return current

# Example usage
math_score = get_nested(users, ['john', 'scores', 'math'], 0)

# Updating nested values
def update_nested(dict_obj, path, value):
    """Update nested dictionary value."""
    current = dict_obj
    for key in path[:-1]:
        current = current.setdefault(key, {})
    current[path[-1]] = value

# Example usage
update_nested(users, ['john', 'scores', 'science'], 88)
```

## Common Patterns

### 1. Default Values

```python
from collections import defaultdict

# Integer defaults
int_dict = defaultdict(int)
int_dict['a'] += 1  # No KeyError if 'a' doesn't exist

# List defaults
list_dict = defaultdict(list)
list_dict['users'].append('John')

# Custom defaults
def get_default():
    return {'count': 0, 'total': 0}
stats_dict = defaultdict(get_default)
```

### 2. Grouping and Counting

```python
# Grouping items
def group_by(items, key_func):
    groups = defaultdict(list)
    for item in items:
        groups[key_func(item)].append(item)
    return dict(groups)

# Example usage
users = [{'name': 'John', 'age': 30}, {'name': 'Jane', 'age': 30}]
by_age = group_by(users, lambda x: x['age'])

# Counting elements
from collections import Counter
words = ['apple', 'banana', 'apple', 'cherry']
word_counts = Counter(words)
```

### 3. Dictionary Merging

```python
# Python 3.9+ merge operator
combined = dict1 | dict2

# Update method
def merge_dicts(*dicts):
    result = {}
    for d in dicts:
        result.update(d)
    return result

# Deep merge
def deep_merge(dict1, dict2):
    result = dict1.copy()
    for key, value in dict2.items():
        if (key in result and
            isinstance(result[key], dict) and
            isinstance(value, dict)):
            result[key] = deep_merge(result[key], value)
        else:
            result[key] = value
    return result
```

## Advanced Operations

### 1. Custom Dictionary Classes

```python
class PersistentDict(dict):
    """Dictionary that persists to disk."""
    def __init__(self, filename):
        self.filename = filename
        try:
            with open(filename, 'r') as f:
                super().__init__(json.load(f))
        except FileNotFoundError:
            super().__init__()

    def __setitem__(self, key, value):
        super().__setitem__(key, value)
        with open(self.filename, 'w') as f:
            json.dump(dict(self), f)
```

### 2. Dictionary Transformations

```python
def transform_values(d, func):
    """Transform all values in dictionary."""
    return {k: func(v) for k, v in d.items()}

def transform_keys(d, func):
    """Transform all keys in dictionary."""
    return {func(k): v for k, v in d.items()}

# Example usage
data = {'a': 1, 'b': 2}
squared_values = transform_values(data, lambda x: x**2)
upper_keys = transform_keys(data, str.upper)
```

## Performance Considerations

### Time Complexity

| Operation  | Average Case | Notes               |
| ---------- | ------------ | ------------------- |
| Access     | O(1)         | Hash table lookup   |
| Assignment | O(1)         | Hash table insert   |
| Deletion   | O(1)         | Hash table delete   |
| Search     | O(1)         | Key existence check |
| Copy       | O(n)         | Shallow copy        |
| Items      | O(n)         | Get all items       |

### Memory Usage

```python
# Memory-efficient patterns
from sys import getsizeof

# Use tuples for immutable keys
tuple_key = {(1, 2): 'value'}  # More efficient than list key

# Use None as sentinel
sentinel = object()  # More efficient than string sentinel

def get_value(d, key):
    result = d.get(key, sentinel)
    return None if result is sentinel else result
```

## Best Practices

### 1. Key Selection

```python
# Good - Immutable keys
config = {
    'app_name': 'MyApp',
    ('localhost', 8000): 'main_server',
    frozenset(['user', 'admin']): 'permissions'
}

# Bad - Mutable keys (will raise TypeError)
bad_dict = {['a', 'b']: 'value'}
```

### 2. Safe Operations

```python
# Good - Safe access
def get_user_setting(settings, key):
    return settings.get(key, default_settings[key])

# Bad - Direct access
def get_user_setting_bad(settings, key):
    return settings[key]  # May raise KeyError
```

### 3. Dictionary Updates

```python
# Good - Use update method
def update_settings(settings, **new_settings):
    settings.update(new_settings)

# Better - Return new dictionary
def update_settings_immutable(settings, **new_settings):
    return {**settings, **new_settings}
```

Remember:

- Use appropriate key types (immutable)
- Consider defaultdict for automatic defaults
- Use dictionary comprehensions for transformations
- Implement deep copy for nested structures
- Handle missing keys gracefully
- Use view objects for dynamic access
- Consider memory usage for large dictionaries
- Use Counter for counting operations
