# Python Data Type Operations Guide

## Overview

This guide provides a comprehensive look at operations and functions commonly used with different Python data types. The content is divided into multiple files for better organization:

1. [Numeric Operations](08_01_numeric_operations.md)

   - Integer operations
   - Float operations
   - Complex number operations
   - Mathematical functions

2. [String Operations](08_02_string_operations.md)

   - String manipulation
   - String formatting
   - String methods
   - Regular expressions with strings

3. [List and Tuple Operations](08_03_sequence_operations.md)

   - List methods and operations
   - Tuple operations
   - Sequence functions
   - List comprehensions

4. [Dictionary Operations](08_04_dictionary_operations.md)

   - Dictionary methods
   - Dictionary comprehensions
   - Nested dictionaries
   - Dictionary views

5. [Set Operations](08_05_set_operations.md)

   - Set methods
   - Set operations
   - Frozen sets
   - Set comprehensions

6. [Advanced Data Type Operations](08_06_advanced_operations.md)
   - Custom objects
   - Collections module
   - Iterator operations
   - Generator operations

## Quick Reference Tables

### Common Operators Across Data Types

| Operator | Description   | String | List | Dict | Set | Example                      |
| -------- | ------------- | ------ | ---- | ---- | --- | ---------------------------- |
| `+`      | Concatenation | ✓      | ✓    | -    | -   | `"a" + "b"`, `[1] + [2]`     |
| `*`      | Repetition    | ✓      | ✓    | -    | -   | `"a" * 3`, `[1] * 3`         |
| `in`     | Membership    | ✓      | ✓    | ✓    | ✓   | `"a" in "abc"`, `1 in [1,2]` |
| `[]`     | Indexing      | ✓      | ✓    | ✓    | -   | `"abc"[0]`, `list[0]`        |
| `[:]`    | Slicing       | ✓      | ✓    | -    | -   | `"abc"[1:2]`, `list[1:2]`    |
| `len()`  | Length        | ✓      | ✓    | ✓    | ✓   | `len("abc")`, `len([1,2])`   |

### Universal Functions

| Function       | Description     | Example                          |
| -------------- | --------------- | -------------------------------- |
| `type()`       | Get type        | `type(42)` -> `<class 'int'>`    |
| `id()`         | Get object ID   | `id(obj)` -> Memory address      |
| `isinstance()` | Type check      | `isinstance(42, int)` -> `True`  |
| `hash()`       | Get hash value  | `hash("string")` -> Hash value   |
| `dir()`        | List attributes | `dir(obj)` -> List of attributes |

### Common Built-in Functions

| Function      | Description       | Example                       |
| ------------- | ----------------- | ----------------------------- |
| `len()`       | Get length        | `len([1, 2, 3])` -> `3`       |
| `print()`     | Output value      | `print("Hello")`              |
| `input()`     | Get user input    | `name = input("Name: ")`      |
| `range()`     | Create sequence   | `list(range(3))` -> `[0,1,2]` |
| `enumerate()` | Index items       | `list(enumerate(['a','b']))`  |
| `zip()`       | Combine iterables | `list(zip([1,2], ['a','b']))` |
| `map()`       | Transform items   | `list(map(str, [1,2,3]))`     |
| `filter()`    | Filter items      | `list(filter(bool, [0,1,2]))` |

## Navigation Guide

Each specific file contains:

- Detailed operator tables
- Common function references
- Practical examples
- Best practices
- Performance considerations
- Common pitfalls
- Advanced use cases

## Best Practices Overview

1. **Type Checking**

```python
# Good - Using isinstance() for type checking
def process_number(num):
    if isinstance(num, (int, float)):
        return num * 2
    raise TypeError("Expected number")

# Bad - Using type() for type checking
def process_number(num):
    if type(num) == int or type(num) == float:
        return num * 2
    raise TypeError("Expected number")
```

2. **Operation Selection**

```python
# Good - Using appropriate operations
def merge_lists(list1, list2):
    return [*list1, *list2]  # Unpacking

# Bad - Using + operator
def merge_lists(list1, list2):
    return list1 + list2  # Creates new list
```

3. **Performance Considerations**

```python
# Good - Using set for lookups
valid_items = set(['a', 'b', 'c'])
if item in valid_items:  # O(1) lookup
    process(item)

# Bad - Using list for lookups
valid_items = ['a', 'b', 'c']
if item in valid_items:  # O(n) lookup
    process(item)
```

## Common Gotchas

1. **Mutable Default Arguments**

```python
# Wrong
def append_to(element, lst=[]):
    lst.append(element)
    return lst

# Right
def append_to(element, lst=None):
    if lst is None:
        lst = []
    lst.append(element)
    return lst
```

2. **Copy vs Reference**

```python
# Wrong - Shallow copy
list1 = [1, [2, 3]]
list2 = list1.copy()
list2[1][0] = 4  # Affects both lists

# Right - Deep copy
import copy
list2 = copy.deepcopy(list1)
list2[1][0] = 4  # Only affects list2
```

## Additional Resources

- [Python Official Documentation](https://docs.python.org/3/library/stdtypes.html)
- [Python Data Model](https://docs.python.org/3/reference/datamodel.html)
- [Python Built-in Functions](https://docs.python.org/3/library/functions.html)

Each subsequent file will dive deep into specific data types and their operations. Would you like me to create any specific file first?
