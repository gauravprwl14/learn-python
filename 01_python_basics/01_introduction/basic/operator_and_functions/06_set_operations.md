# Set Operations in Python

## Table of Contents

- [Set Basics](#set-basics)
- [Set Methods](#set-methods)
- [Set Operations](#set-operations)
- [Set Comprehensions](#set-comprehensions)
- [Frozen Sets](#frozen-sets)
- [Common Use Cases](#common-use-cases)
- [Performance Considerations](#performance-considerations)
- [Best Practices](#best-practices)

## Set Basics

### Key Characteristics

- Unordered collection of unique elements
- Mutable (except frozenset)
- Elements must be hashable
- No indexing or slicing
- Highly optimized for membership testing
- Mathematical set operations supported

### Creation Methods

| Method        | Example                 | Result                 | Notes           |
| ------------- | ----------------------- | ---------------------- | --------------- |
| Literal       | `{1, 2, 3}`             | `{1, 2, 3}`            | Direct creation |
| Constructor   | `set([1, 2, 3])`        | `{1, 2, 3}`            | From iterable   |
| Empty Set     | `set()`                 | `set()`                | Cannot use `{}` |
| Comprehension | `{x for x in range(3)}` | `{0, 1, 2}`            | Set builder     |
| From String   | `set('hello')`          | `{'h', 'e', 'l', 'o'}` | Unique chars    |

```python
# Different creation methods
empty_set = set()                   # Empty set
literal_set = {1, 2, 3}            # Direct creation
from_list = set([1, 2, 2, 3])      # From list, duplicates removed
from_tuple = set((1, 2, 3))        # From tuple
from_string = set('hello')         # From string
from_range = set(range(5))         # From range

# Note: {} creates an empty dictionary, not a set
empty_dict = {}  # This is a dict, not a set
```

## Set Methods

### Basic Methods

| Method      | Description       | Example        | Result              | Time Complexity |
| ----------- | ----------------- | -------------- | ------------------- | --------------- |
| `add()`     | Add element       | `s.add(4)`     | `{1, 2, 3, 4}`      | O(1)            |
| `remove()`  | Remove element    | `s.remove(4)`  | Raises if missing   | O(1)            |
| `discard()` | Remove if present | `s.discard(4)` | No error if missing | O(1)            |
| `pop()`     | Remove and return | `s.pop()`      | Random element      | O(1)            |
| `clear()`   | Remove all        | `s.clear()`    | Empty set           | O(1)            |
| `copy()`    | Shallow copy      | `s.copy()`     | New set             | O(n)            |

### Set Operations Methods

| Method                   | Description    | Example                       | Result              |
| ------------------------ | -------------- | ----------------------------- | ------------------- |
| `union()`                | Union of sets  | `s1.union(s2)`                | All elements        |
| `intersection()`         | Intersection   | `s1.intersection(s2)`         | Common elements     |
| `difference()`           | Difference     | `s1.difference(s2)`           | In s1 but not s2    |
| `symmetric_difference()` | Symmetric diff | `s1.symmetric_difference(s2)` | In one but not both |
| `issubset()`             | Subset test    | `s1.issubset(s2)`             | Boolean             |
| `issuperset()`           | Superset test  | `s1.issuperset(s2)`           | Boolean             |
| `isdisjoint()`           | Disjoint test  | `s1.isdisjoint(s2)`           | Boolean             |

### Update Methods

| Method                          | Description           | Example                              | Notes       |
| ------------------------------- | --------------------- | ------------------------------------ | ----------- |
| `update()`                      | Union update          | `s1.update(s2)`                      | Modifies s1 |
| `intersection_update()`         | Intersection update   | `s1.intersection_update(s2)`         | Modifies s1 |
| `difference_update()`           | Difference update     | `s1.difference_update(s2)`           | Modifies s1 |
| `symmetric_difference_update()` | Symmetric diff update | `s1.symmetric_difference_update(s2)` | Modifies s1 |

```python
# Method examples
s1 = {1, 2, 3}
s2 = {3, 4, 5}

# Adding and removing
s1.add(4)              # {1, 2, 3, 4}
s1.remove(4)           # {1, 2, 3}
s1.discard(4)          # No error if 4 not present

# Set operations
union = s1.union(s2)                # {1, 2, 3, 4, 5}
intersection = s1.intersection(s2)   # {3}
difference = s1.difference(s2)       # {1, 2}
sym_diff = s1.symmetric_difference(s2)  # {1, 2, 4, 5}

# Update operations
s1.update(s2)                       # Modifies s1 to include s2
s1.intersection_update(s2)          # Keeps only common elements
s1.difference_update(s2)            # Removes elements in s2
s1.symmetric_difference_update(s2)  # Keeps elements in one but not both
```

## Set Operations

### Operators

| Operator | Description          | Example    | Result              |
| -------- | -------------------- | ---------- | ------------------- |
| `\|`     | Union                | `s1 \| s2` | All elements        |
| `&`      | Intersection         | `s1 & s2`  | Common elements     |
| `-`      | Difference           | `s1 - s2`  | In s1 but not s2    |
| `^`      | Symmetric difference | `s1 ^ s2`  | In one but not both |
| `<=`     | Subset               | `s1 <= s2` | Boolean             |
| `>=`     | Superset             | `s1 >= s2` | Boolean             |
| `<`      | Proper subset        | `s1 < s2`  | Boolean             |
| `>`      | Proper superset      | `s1 > s2`  | Boolean             |

```python
# Operator examples
s1 = {1, 2, 3}
s2 = {3, 4, 5}
s3 = {1, 2, 3, 4}

# Set operations
print(s1 | s2)     # Union: {1, 2, 3, 4, 5}
print(s1 & s2)     # Intersection: {3}
print(s1 - s2)     # Difference: {1, 2}
print(s1 ^ s2)     # Symmetric difference: {1, 2, 4, 5}

# Comparison operations
print(s1 <= s3)    # Subset: True
print(s3 >= s1)    # Superset: True
print(s1 < s3)     # Proper subset: True
print(s3 > s1)     # Proper superset: True
```

## Set Comprehensions

### Basic Patterns

```python
# Simple set comprehension
squares = {x**2 for x in range(10)}

# With condition
even_squares = {x**2 for x in range(10) if x % 2 == 0}

# Multiple conditions
complex_set = {x for x in range(100)
              if x % 2 == 0
              if x % 3 == 0}

# From another collection
words = ['hello', 'world', 'hello']
unique_words = {word.upper() for word in words}
```

## Frozen Sets

### Working with Immutable Sets

```python
# Creating frozen sets
fs1 = frozenset([1, 2, 3])
fs2 = frozenset([3, 4, 5])

# Operations (return new frozensets)
union = fs1 | fs2
intersection = fs1 & fs2

# Use as dictionary keys
set_map = {
    frozenset([1, 2]): 'set1',
    frozenset([3, 4]): 'set2'
}

# Cannot modify
# fs1.add(4)  # AttributeError
```

## Common Use Cases

### 1. Removing Duplicates

```python
def remove_duplicates(items):
    """Remove duplicates while maintaining type."""
    return type(items)(set(items))

# Examples
no_dups_list = remove_duplicates([1, 2, 2, 3, 3, 3])
no_dups_tuple = remove_duplicates((1, 2, 2, 3, 3, 3))
no_dups_string = ''.join(remove_duplicates('hello'))
```

### 2. Membership Testing

```python
def validate_categories(categories, valid_categories):
    """Validate all categories exist in valid set."""
    categories_set = set(categories)
    valid_set = set(valid_categories)

    invalid = categories_set - valid_set
    if invalid:
        raise ValueError(f"Invalid categories: {invalid}")
    return True

# Example usage
valid = {'A', 'B', 'C'}
validate_categories(['A', 'B'], valid)  # True
validate_categories(['A', 'D'], valid)  # Raises ValueError
```

### 3. Finding Common Elements

```python
def find_common_elements(*iterables):
    """Find elements common to all iterables."""
    if not iterables:
        return set()

    sets = [set(it) for it in iterables]
    return sets[0].intersection(*sets[1:])

# Example usage
common = find_common_elements(
    [1, 2, 3, 4],
    [2, 3, 4, 5],
    [3, 4, 5, 6]
)  # {3, 4}
```

### 4. Set Operations in Data Analysis

```python
def analyze_user_actions(user_sets):
    """Analyze user action patterns."""
    all_users = set().union(*user_sets.values())
    active_users = set.intersection(*user_sets.values())
    occasional_users = all_users - active_users

    return {
        'total_users': len(all_users),
        'active_users': len(active_users),
        'occasional_users': len(occasional_users)
    }

# Example usage
user_actions = {
    'logged_in': {'user1', 'user2', 'user3'},
    'made_purchase': {'user1', 'user2'},
    'left_review': {'user1', 'user3'}
}
analysis = analyze_user_actions(user_actions)
```

## Performance Considerations

### Time Complexity

| Operation    | Average Case             | Notes                |
| ------------ | ------------------------ | -------------------- |
| Add          | O(1)                     | Hash table insertion |
| Remove       | O(1)                     | Hash table deletion  |
| Membership   | O(1)                     | Hash table lookup    |
| Union        | O(len(s1) + len(s2))     | Create new set       |
| Intersection | O(min(len(s1), len(s2))) | Check smaller set    |
| Difference   | O(len(s1))               | Check each element   |

### Memory Usage

```python
# Memory-efficient patterns
from sys import getsizeof

# Use frozen set for constants
VALID_STATES = frozenset(['active', 'pending', 'closed'])

# Use set for lookups instead of list
valid_users = set(users)  # O(1) lookup
if user in valid_users:   # More efficient than list
    process_user(user)
```

## Best Practices

### 1. Choosing Between Set Types

```python
# Use set when contents change
mutable_tags = set(['python', 'coding'])
mutable_tags.add('programming')

# Use frozenset for constants or dict keys
PERMISSIONS = frozenset(['read', 'write', 'execute'])
permission_map = {
    frozenset(['read']): 'basic',
    frozenset(['read', 'write']): 'advanced'
}
```

### 2. Set Operations vs Methods

```python
# Operator style (more readable for simple operations)
union = s1 | s2
intersection = s1 & s2

# Method style (more flexible, accepts multiple sets)
union = s1.union(s2, s3, s4)
intersection = s1.intersection(s2, s3, s4)
```

### 3. Error Handling

```python
def safe_set_operation(func, *sets):
    """Safely perform set operation."""
    try:
        return func(*map(set, sets))
    except TypeError as e:
        raise TypeError(f"Unhashable element in sets: {e}")

# Example usage
result = safe_set_operation(set.union, [1, 2], [2, 3])
```

Remember:

- Use sets for unique collections
- Choose between set and frozenset based on mutability needs
- Use set operations for mathematical set operations
- Consider performance implications for large sets
- Handle unhashable elements appropriately
- Use frozenset for dictionary keys
- Leverage set comprehensions for efficient creation
