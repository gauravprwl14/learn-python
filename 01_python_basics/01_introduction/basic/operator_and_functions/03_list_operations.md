# List Operations in Python

## Table of Contents

- [List Operators](#list-operators)
- [List Methods](#list-methods)
- [List Functions](#list-functions)
- [List Comprehensions](#list-comprehensions)
- [List Slicing](#list-slicing)
- [Common Operations](#common-operations)
- [Performance Tips](#performance-tips)

## List Operators

### Basic Operators Table

| Operator   | Description    | Example              | Result               | Notes                    |
| ---------- | -------------- | -------------------- | -------------------- | ------------------------ |
| `+`        | Concatenation  | `[1, 2] + [3, 4]`    | `[1, 2, 3, 4]`       | Creates new list         |
| `*`        | Repetition     | `[1, 2] * 3`         | `[1, 2, 1, 2, 1, 2]` | Creates new list         |
| `in`       | Membership     | `3 in [1, 2, 3]`     | `True`               | O(n) operation           |
| `not in`   | Non-membership | `4 not in [1, 2, 3]` | `True`               | O(n) operation           |
| `==`       | Equality       | `[1, 2] == [1, 2]`   | `True`               | Compares values          |
| `is`       | Identity       | `a is b`             | Varies               | Compares memory location |
| `<`, `>`   | Comparison     | `[1, 2] < [1, 3]`    | `True`               | Lexicographical order    |
| `<=`, `>=` | Comparison     | `[1, 2] <= [1, 2]`   | `True`               | Lexicographical order    |

### Operator Examples

```python
# Concatenation vs Extend
list1 = [1, 2]
list2 = [3, 4]
concat_list = list1 + list2  # New list: [1, 2, 3, 4]
list1.extend(list2)          # Modifies list1: [1, 2, 3, 4]

# Multiplication
zeros = [0] * 5             # [0, 0, 0, 0, 0]
nested = [[]] * 3           # Warning: Creates references to same list

# Proper way to create nested lists
nested = [[] for _ in range(3)]  # Creates independent lists
```

## List Methods

### Modification Methods

| Method             | Description             | Example              | Result            | Time Complexity |
| ------------------ | ----------------------- | -------------------- | ----------------- | --------------- |
| `append(x)`        | Add item to end         | `lst.append(4)`      | `[1, 2, 3, 4]`    | O(1)            |
| `extend(iterable)` | Add items to end        | `lst.extend([4, 5])` | `[1, 2, 3, 4, 5]` | O(k)            |
| `insert(i, x)`     | Insert at index         | `lst.insert(1, 4)`   | `[1, 4, 2, 3]`    | O(n)            |
| `remove(x)`        | Remove first occurrence | `lst.remove(2)`      | `[1, 3]`          | O(n)            |
| `pop([i])`         | Remove & return item    | `lst.pop()`          | Last item         | O(1) or O(n)    |
| `clear()`          | Remove all items        | `lst.clear()`        | `[]`              | O(1)            |

### Query Methods

| Method                     | Description       | Example        | Result        | Time Complexity |
| -------------------------- | ----------------- | -------------- | ------------- | --------------- |
| `index(x[, start[, end]])` | Find first index  | `lst.index(2)` | Index of 2    | O(n)            |
| `count(x)`                 | Count occurrences | `lst.count(2)` | Number of 2s  | O(n)            |
| `copy()`                   | Shallow copy      | `lst.copy()`   | New list copy | O(n)            |

### Ordering Methods

| Method                   | Description      | Example         | Notes         | Time Complexity |
| ------------------------ | ---------------- | --------------- | ------------- | --------------- |
| `sort([key][, reverse])` | Sort in place    | `lst.sort()`    | Modifies list | O(n log n)      |
| `reverse()`              | Reverse in place | `lst.reverse()` | Modifies list | O(n)            |

### Method Examples

```python
# Append vs Extend
numbers = [1, 2, 3]
numbers.append([4, 5])    # [1, 2, 3, [4, 5]]
numbers = [1, 2, 3]
numbers.extend([4, 5])    # [1, 2, 3, 4, 5]

# Insert with negative indices
numbers = [1, 2, 3]
numbers.insert(-1, 4)     # [1, 2, 4, 3]

# Sort with key function
data = ['cat', 'dog', 'elephant']
data.sort(key=len)        # ['cat', 'dog', 'elephant']
data.sort(key=str.lower)  # Case-insensitive sort

# Custom sort key
users = [{'name': 'John', 'age': 30}, {'name': 'Alice', 'age': 25}]
users.sort(key=lambda x: (x['age'], x['name']))
```

## List Functions

### Built-in Functions

| Function         | Description     | Example                      | Result              | Time Complexity |
| ---------------- | --------------- | ---------------------------- | ------------------- | --------------- |
| `len(lst)`       | Get length      | `len([1, 2, 3])`             | `3`                 | O(1)            |
| `sum(lst)`       | Sum items       | `sum([1, 2, 3])`             | `6`                 | O(n)            |
| `max(lst)`       | Maximum value   | `max([1, 2, 3])`             | `3`                 | O(n)            |
| `min(lst)`       | Minimum value   | `min([1, 2, 3])`             | `1`                 | O(n)            |
| `all(lst)`       | All true?       | `all([True, True])`          | `True`              | O(n)            |
| `any(lst)`       | Any true?       | `any([False, True])`         | `True`              | O(n)            |
| `sorted(lst)`    | Return sorted   | `sorted([3, 1, 2])`          | `[1, 2, 3]`         | O(n log n)      |
| `reversed(lst)`  | Return reversed | `list(reversed([1,2,3]))`    | `[3, 2, 1]`         | O(n)            |
| `enumerate(lst)` | Index pairs     | `list(enumerate(['a','b']))` | `[(0,'a'),(1,'b')]` | O(n)            |

### Function Examples

```python
# Advanced sorting
numbers = [1, -2, 3, -4]
abs_sorted = sorted(numbers, key=abs)    # [1, -2, 3, -4]
reverse_sorted = sorted(numbers, reverse=True)  # [3, 1, -2, -4]

# Using enumerate
for i, value in enumerate(['a', 'b', 'c'], start=1):
    print(f"{i}: {value}")  # "1: a", "2: b", "3: c"

# List filtering with all/any
def is_valid_list(lst):
    return all(isinstance(x, (int, float)) for x in lst)

def has_positive(lst):
    return any(x > 0 for x in lst)
```

## List Comprehensions

### Basic Patterns

```python
# Simple mapping
numbers = [1, 2, 3, 4, 5]
squares = [x**2 for x in numbers]              # [1, 4, 9, 16, 25]

# Filtering
evens = [x for x in numbers if x % 2 == 0]     # [2, 4]

# Mapping and filtering
even_squares = [x**2 for x in numbers if x % 2 == 0]  # [4, 16]

# Nested loops
matrix = [[i+j for j in range(3)] for i in range(3)]
# [[0,1,2], [1,2,3], [2,3,4]]

# Multiple conditions
[x for x in numbers if x % 2 == 0 if x % 3 == 0]  # Multiple filters

# Multiple for loops
[(x,y) for x in [1,2] for y in ['a','b']]  # [(1,'a'),(1,'b'),(2,'a'),(2,'b')]
```

### Advanced Patterns

```python
# Flattening nested lists
nested = [[1, 2], [3, 4]]
flat = [item for sublist in nested for item in sublist]  # [1, 2, 3, 4]

# Dictionary to list
dict1 = {'a': 1, 'b': 2}
items = [(k, v) for k, v in dict1.items()]  # [('a', 1), ('b', 2)]

# Conditional expressions
[x if x > 0 else 0 for x in numbers]  # Replace negatives with 0

# Set comprehension
{x**2 for x in numbers}  # Create set of squares

# Generator expression
sum(x**2 for x in numbers)  # More memory efficient
```

## List Slicing

### Slicing Syntax

| Syntax           | Description         | Example           | Result      |
| ---------------- | ------------------- | ----------------- | ----------- |
| `lst[start:end]` | Basic slice         | `[1,2,3,4][1:3]`  | `[2,3]`     |
| `lst[start:]`    | From start to end   | `[1,2,3,4][1:]`   | `[2,3,4]`   |
| `lst[:end]`      | From start to end-1 | `[1,2,3,4][:3]`   | `[1,2,3]`   |
| `lst[:]`         | Full copy           | `[1,2,3,4][:]`    | `[1,2,3,4]` |
| `lst[::step]`    | With step           | `[1,2,3,4][::2]`  | `[1,3]`     |
| `lst[::-1]`      | Reverse             | `[1,2,3,4][::-1]` | `[4,3,2,1]` |

### Slicing Examples

```python
# Advanced slicing
numbers = [0, 1, 2, 3, 4, 5]
print(numbers[2:4])     # [2, 3]
print(numbers[-3:])     # [3, 4, 5]
print(numbers[:-2])     # [0, 1, 2, 3]
print(numbers[::2])     # [0, 2, 4]
print(numbers[::-2])    # [5, 3, 1]

# Slice assignment
numbers[1:4] = [6, 7, 8]  # Replace section
numbers[::2] = [0, 0, 0]  # Replace every other element
```

## Common Operations

### List Manipulation Patterns

```python
# Remove duplicates while preserving order
def remove_duplicates(lst):
    seen = set()
    return [x for x in lst if not (x in seen or seen.add(x))]

# Chunking a list
def chunk_list(lst, chunk_size):
    return [lst[i:i + chunk_size]
            for i in range(0, len(lst), chunk_size)]

# Finding all indices of an element
def find_all_indices(lst, value):
    return [i for i, x in enumerate(lst) if x == value]

# Rotating a list
def rotate_list(lst, k):
    k = k % len(lst)
    return lst[-k:] + lst[:-k]
```

### List as Stack/Queue

```python
# Stack operations (LIFO)
stack = []
stack.append(1)      # Push
stack.append(2)
top = stack.pop()    # Pop

# Queue operations (FIFO)
from collections import deque
queue = deque()
queue.append(1)      # Enqueue
queue.append(2)
front = queue.popleft()  # Dequeue
```

## Performance Tips

### Efficiency Considerations

```python
# Good - Using list comprehension
squares = [x**2 for x in numbers]

# Bad - Using loop and append
squares = []
for x in numbers:
    squares.append(x**2)

# Good - Using extend
list1.extend(list2)

# Bad - Using + operator in loop
result = []
for lst in lists:
    result = result + lst

# Good - Preallocating space
known_size = 1000
lst = [0] * known_size

# Bad - Growing list dynamically
lst = []
for i in range(known_size):
    lst.append(0)
```

### Memory Considerations

```python
# Good - Using generators for large sequences
sum(x**2 for x in range(1000000))

# Bad - Using list comprehension for large sequences
sum([x**2 for x in range(1000000)])

# Good - Using itertools for combinations
from itertools import combinations
combos = combinations(range(1000), 2)

# Bad - Storing all combinations in list
combos = [(x,y) for x in range(1000)
                for y in range(x+1, 1000)]
```

Remember:

- List operations that modify in-place are generally more efficient
- Use appropriate data structures for your use case
- Consider memory usage for large lists
- Use built-in functions and methods when available
- List comprehensions are generally faster than loops
- Avoid growing lists incrementally when size is known
- Use generators for large sequences when possible
