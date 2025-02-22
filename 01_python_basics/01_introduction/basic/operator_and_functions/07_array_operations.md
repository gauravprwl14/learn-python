# Array Operations in Python

## Table of Contents

- [Standard Arrays](#standard-arrays)
- [NumPy Arrays](#numpy-arrays)
- [Array Methods](#array-methods)
- [Array Operations](#array-operations)
- [Array Slicing](#array-slicing)
- [Common Use Cases](#common-use-cases)
- [Performance Considerations](#performance-considerations)
- [Best Practices](#best-practices)

## Standard Arrays

### Array Module Basics

```python
from array import array

# Type codes for array
"""
'b' - signed char (int, size 1 byte)
'B' - unsigned char (int, size 1 byte)
'h' - signed short (int, size 2 bytes)
'H' - unsigned short (int, size 2 bytes)
'i' - signed int (int, size 2 bytes)
'I' - unsigned int (int, size 2 bytes)
'l' - signed long (int, size 4 bytes)
'L' - unsigned long (int, size 4 bytes)
'q' - signed long long (int, size 8 bytes)
'Q' - unsigned long long (int, size 8 bytes)
'f' - float (float, size 4 bytes)
'd' - double (float, size 8 bytes)
"""
```

### Creation Methods

| Method                      | Example                 | Description            |
| --------------------------- | ----------------------- | ---------------------- |
| `array(typecode, [values])` | `array('i', [1, 2, 3])` | Create from iterable   |
| `array.fromfile(f, n)`      | `arr.fromfile(f, 5)`    | Read n items from file |
| `array.fromlist(list)`      | `arr.fromlist([1,2,3])` | Create from list       |
| `array.frombytes(bytes)`    | `arr.frombytes(b'...')` | Create from bytes      |

```python
# Creating arrays
int_array = array('i', [1, 2, 3, 4, 5])
float_array = array('f', [1.0, 2.0, 3.0, 4.0])
unsigned_array = array('I', [1, 2, 3, 4])

# From different sources
from_list = array('i', [1, 2, 3])
from_bytes = array('i', bytes([1, 0, 0, 0]))
```

### Basic Operations

| Operation   | Example                | Description             |
| ----------- | ---------------------- | ----------------------- |
| `append()`  | `arr.append(x)`        | Add item to end         |
| `extend()`  | `arr.extend(iterable)` | Add items from iterable |
| `insert()`  | `arr.insert(i, x)`     | Insert at index         |
| `remove()`  | `arr.remove(x)`        | Remove first occurrence |
| `pop()`     | `arr.pop([i])`         | Remove and return item  |
| `index()`   | `arr.index(x)`         | Find first occurrence   |
| `count()`   | `arr.count(x)`         | Count occurrences       |
| `reverse()` | `arr.reverse()`        | Reverse in place        |

## NumPy Arrays

### Creation Methods

```python
import numpy as np

# Basic array creation
arr1 = np.array([1, 2, 3])               # 1D array
arr2 = np.array([[1, 2], [3, 4]])        # 2D array
zeros = np.zeros((3, 3))                 # Array of zeros
ones = np.ones((2, 2))                   # Array of ones
empty = np.empty((2, 3))                 # Uninitialized array
range_arr = np.arange(0, 10, 2)          # Array from range
linspace = np.linspace(0, 1, 5)          # Evenly spaced numbers
random_arr = np.random.rand(3, 3)        # Random array
identity = np.eye(3)                     # Identity matrix
```

### Array Attributes

| Attribute  | Description          | Example        |
| ---------- | -------------------- | -------------- |
| `shape`    | Array dimensions     | `arr.shape`    |
| `dtype`    | Data type            | `arr.dtype`    |
| `size`     | Total elements       | `arr.size`     |
| `ndim`     | Number of dimensions | `arr.ndim`     |
| `itemsize` | Bytes per element    | `arr.itemsize` |
| `nbytes`   | Total bytes          | `arr.nbytes`   |

### Basic Operations

```python
# Arithmetic operations
a = np.array([1, 2, 3])
b = np.array([4, 5, 6])

addition = a + b
subtraction = a - b
multiplication = a * b
division = a / b
power = a ** 2
dot_product = np.dot(a, b)

# Matrix operations
m1 = np.array([[1, 2], [3, 4]])
m2 = np.array([[5, 6], [7, 8]])

matrix_mult = np.matmul(m1, m2)
determinant = np.linalg.det(m1)
inverse = np.linalg.inv(m1)
eigenvals = np.linalg.eigvals(m1)
```

### Array Functions

| Function        | Description        | Example                 |
| --------------- | ------------------ | ----------------------- |
| `reshape()`     | Change shape       | `arr.reshape(2,3)`      |
| `transpose()`   | Transpose array    | `arr.transpose()`       |
| `flatten()`     | Flatten to 1D      | `arr.flatten()`         |
| `sort()`        | Sort array         | `np.sort(arr)`          |
| `concatenate()` | Join arrays        | `np.concatenate([a,b])` |
| `split()`       | Split array        | `np.split(arr, 3)`      |
| `vstack()`      | Stack vertically   | `np.vstack([a,b])`      |
| `hstack()`      | Stack horizontally | `np.hstack([a,b])`      |

## Array Methods

### Mathematical Operations

```python
# Statistics
mean = np.mean(arr)
median = np.median(arr)
std = np.std(arr)
var = np.var(arr)

# Aggregations
sum_all = np.sum(arr)
prod_all = np.prod(arr)
min_val = np.min(arr)
max_val = np.max(arr)
argmin = np.argmin(arr)  # Index of minimum
argmax = np.argmax(arr)  # Index of maximum

# Linear algebra
norm = np.linalg.norm(arr)
rank = np.linalg.matrix_rank(arr)
trace = np.trace(arr)
```

### Array Manipulation

```python
# Reshaping and transposing
reshaped = arr.reshape(3, 4)
transposed = arr.T
ravel = arr.ravel()  # Flatten array
rolled = np.roll(arr, 2)  # Circular shift

# Joining and splitting
split = np.split(arr, 3)  # Split into 3 parts
hsplit = np.hsplit(arr, 2)  # Split horizontally
vsplit = np.vsplit(arr, 2)  # Split vertically
```

## Array Operations

### Broadcasting

```python
# Broadcasting rules
a = np.array([[1, 2, 3],
              [4, 5, 6]])
b = np.array([10, 20, 30])

# Broadcasting addition
c = a + b  # b is broadcast to match a's shape

# Broadcasting with scalar
scaled = a * 2

# Broadcasting comparison
mask = a > 3
```

### Indexing and Slicing

```python
# Basic indexing
arr = np.array([[1, 2, 3],
                [4, 5, 6],
                [7, 8, 9]])

element = arr[1, 1]      # Single element
row = arr[1]            # Entire row
column = arr[:, 1]      # Entire column
sub_array = arr[0:2, 1:3]  # Sub-array

# Boolean indexing
mask = arr > 5
filtered = arr[mask]

# Fancy indexing
indices = [0, 2]
selected = arr[indices]
```

## Common Use Cases

### 1. Data Processing

```python
def process_sensor_data(data):
    """Process sensor data array."""
    # Convert to numpy array
    arr = np.array(data)

    # Remove outliers
    mean = np.mean(arr)
    std = np.std(arr)
    mask = np.abs(arr - mean) <= 2 * std
    cleaned = arr[mask]

    # Normalize data
    normalized = (cleaned - np.min(cleaned)) / \
                (np.max(cleaned) - np.min(cleaned))

    return normalized

# Example usage
sensor_data = [1, 2, 100, 3, 4, 5]  # 100 is outlier
processed = process_sensor_data(sensor_data)
```

### 2. Image Processing

```python
def process_image(image_array):
    """Basic image processing operations."""
    # Normalize pixel values
    normalized = image_array / 255.0

    # Apply threshold
    threshold = 0.5
    binary = normalized > threshold

    # Apply convolution (simple blur)
    kernel = np.ones((3,3)) / 9
    blurred = np.convolve2d(normalized, kernel, mode='same')

    return binary, blurred
```

### 3. Scientific Computing

```python
def solve_linear_system(A, b):
    """Solve system of linear equations Ax = b."""
    try:
        x = np.linalg.solve(A, b)
        return x
    except np.linalg.LinAlgError:
        return None

# Example usage
A = np.array([[1, 2], [3, 4]])
b = np.array([5, 6])
solution = solve_linear_system(A, b)
```

## Performance Considerations

### Memory Management

```python
# Memory-efficient operations
def efficient_operations():
    # Use in-place operations when possible
    arr = np.arange(1000000)
    arr *= 2  # In-place multiplication

    # Use views instead of copies when possible
    view = arr[::2]  # View
    copy = arr[::2].copy()  # Copy

    # Use appropriate dtype
    small_integers = np.array([1,2,3], dtype=np.int8)

# Memory usage comparison
def compare_memory_usage():
    import sys

    # Standard Python list
    py_list = list(range(1000000))
    list_size = sys.getsizeof(py_list)

    # NumPy array
    np_array = np.arange(1000000)
    array_size = np_array.nbytes

    return list_size, array_size
```

### Computational Efficiency

```python
# Vectorization vs loops
def compare_operations():
    arr = np.random.rand(1000000)

    # Slow: Python loop
    def python_square():
        return [x**2 for x in arr]

    # Fast: Vectorized operation
    def numpy_square():
        return arr**2

    # Very slow: Python loop with list append
    def python_filter():
        result = []
        for x in arr:
            if x > 0.5:
                result.append(x)
        return result

    # Fast: Vectorized filtering
    def numpy_filter():
        return arr[arr > 0.5]
```

## Best Practices

### 1. Array Creation

```python
# Good practices
def create_arrays():
    # Specify dtype when creating arrays
    integers = np.array([1, 2, 3], dtype=np.int32)

    # Use zeros, ones, or empty for initialization
    zeros = np.zeros(1000, dtype=np.float32)

    # Use arange for sequences
    sequence = np.arange(0, 10, 0.5)

    # Use linspace for evenly spaced points
    points = np.linspace(0, 1, 100)
```

### 2. Operations and Methods

```python
# Efficient operations
def efficient_computations():
    # Use vectorized operations
    arr = np.random.rand(1000)
    result = np.exp(arr) + np.sin(arr)

    # Use appropriate aggregation methods
    total = np.sum(arr)  # Instead of sum(arr)
    maximum = np.max(arr)  # Instead of max(arr)

    # Use built-in linear algebra functions
    A = np.random.rand(100, 100)
    eigenvalues = np.linalg.eigvals(A)
```

Remember:

- Use NumPy arrays for numerical computations
- Choose appropriate dtypes for memory efficiency
- Use vectorized operations instead of loops
- Leverage built-in NumPy functions
- Consider memory usage for large arrays
- Use appropriate broadcasting techniques
- Handle errors and edge cases properly
