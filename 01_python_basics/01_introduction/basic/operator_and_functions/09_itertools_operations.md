# Itertools Operations in Python

## Table of Contents

- [Infinite Iterators](#infinite-iterators)
- [Finite Iterators](#finite-iterators)
- [Combinatoric Iterators](#combinatoric-iterators)
- [Iterator Operations](#iterator-operations)
- [Common Use Cases](#common-use-cases)
- [Performance Optimization](#performance-optimization)
- [Best Practices](#best-practices)

## Infinite Iterators

### count()

```python
from itertools import count

# Basic counting
counter = count(start=0, step=1)  # 0, 1, 2, ...
negative = count(start=0, step=-1)  # 0, -1, -2, ...
float_counter = count(start=0.5, step=0.5)  # 0.5, 1.0, 1.5, ...

# Practical usage
def create_id_generator(prefix='ID', start=1):
    return (f"{prefix}{num}" for num in count(start))

id_gen = create_id_generator('USER')
# next(id_gen) -> 'USER1', 'USER2', ...
```

### cycle()

```python
from itertools import cycle

# Basic cycling
colors = cycle(['red', 'green', 'blue'])
statuses = cycle(['Running', 'Pending', 'Completed'])

# Practical usage
def round_robin_scheduler(tasks, processors):
    """Distribute tasks among processors in round-robin fashion."""
    assignments = {}
    processor_cycle = cycle(processors)

    for task in tasks:
        processor = next(processor_cycle)
        assignments[task] = processor

    return assignments
```

### repeat()

```python
from itertools import repeat

# Basic repetition
constant = repeat(5)  # 5, 5, 5, ...
limited = repeat(5, 3)  # 5, 5, 5 (3 times)

# Practical usage
def initialize_matrix(rows, cols, value=0):
    """Create a matrix with repeated values."""
    return [list(repeat(value, cols)) for _ in range(rows)]
```

## Finite Iterators

### accumulate()

```python
from itertools import accumulate
import operator

# Basic accumulation
numbers = [1, 2, 3, 4, 5]
running_sum = list(accumulate(numbers))  # [1, 3, 6, 10, 15]
running_product = list(accumulate(numbers, operator.mul))  # [1, 2, 6, 24, 120]

# Custom accumulation
def max_accumulate(numbers):
    """Track running maximum."""
    return accumulate(numbers, max)

prices = [10, 5, 8, 12, 3]
max_prices = list(max_accumulate(prices))  # [10, 10, 10, 12, 12]
```

### chain()

```python
from itertools import chain

# Basic chaining
combined = chain([1, 2], [3, 4], [5, 6])
flattened = chain.from_iterable([[1, 2], [3, 4], [5, 6]])

# Practical usage
def process_multiple_sources(sources):
    """Process multiple data sources as single stream."""
    return chain.from_iterable(source.get_data() for source in sources)
```

### compress()

```python
from itertools import compress

# Basic filtering
data = ['A', 'B', 'C', 'D']
selectors = [1, 0, 1, 0]
selected = list(compress(data, selectors))  # ['A', 'C']

# Practical usage
def filter_by_condition(items, condition):
    """Filter items based on condition."""
    return compress(items, map(condition, items))

# Example: Filter even numbers
numbers = [1, 2, 3, 4, 5]
even = list(filter_by_condition(numbers, lambda x: x % 2 == 0))
```

### dropwhile() and takewhile()

```python
from itertools import dropwhile, takewhile

# Basic usage
numbers = [1, 4, 6, 4, 1]
dropped = list(dropwhile(lambda x: x < 5, numbers))  # [6, 4, 1]
taken = list(takewhile(lambda x: x < 5, numbers))    # [1, 4]

# Practical usage
def process_log_after_date(logs, start_date):
    """Process logs after specific date."""
    return dropwhile(lambda log: log['date'] < start_date, logs)
```

### filterfalse()

```python
from itertools import filterfalse

# Basic filtering
numbers = range(10)
odds = list(filterfalse(lambda x: x % 2 == 0, numbers))

# Practical usage
def get_inactive_users(users):
    """Get list of inactive users."""
    return filterfalse(lambda u: u['active'], users)
```

## Combinatoric Iterators

### product()

```python
from itertools import product

# Cartesian product
colors = ['red', 'green']
sizes = ['S', 'M', 'L']
combinations = list(product(colors, sizes))

# With repeat
binary = list(product([0, 1], repeat=3))  # All 3-digit binary numbers

# Practical usage
def generate_grid_coordinates(x_range, y_range):
    """Generate all coordinates in a grid."""
    return product(range(x_range), range(y_range))
```

### permutations()

```python
from itertools import permutations

# Basic permutations
items = ['A', 'B', 'C']
all_perms = list(permutations(items))
size_2_perms = list(permutations(items, 2))

# Practical usage
def generate_passcodes(digits, length):
    """Generate all possible passcodes."""
    return permutations(digits, length)
```

### combinations() and combinations_with_replacement()

```python
from itertools import combinations, combinations_with_replacement

# Basic combinations
items = ['A', 'B', 'C', 'D']
combs = list(combinations(items, 2))
combs_with_repl = list(combinations_with_replacement(items, 2))

# Practical usage
def generate_test_groups(students, group_size):
    """Generate all possible student groups."""
    return combinations(students, group_size)
```

## Iterator Operations

### groupby()

```python
from itertools import groupby
from operator import itemgetter

# Basic grouping
data = [('A', 1), ('A', 2), ('B', 1), ('B', 2)]
grouped = {k: list(v) for k, v in groupby(data, itemgetter(0))}

# Practical usage
def group_transactions_by_date(transactions):
    """Group transactions by date."""
    sorted_trans = sorted(transactions, key=itemgetter('date'))
    return {
        date: list(group)
        for date, group in groupby(sorted_trans, key=itemgetter('date'))
    }
```

### islice()

```python
from itertools import islice

# Basic slicing
numbers = range(100)
first_10 = list(islice(numbers, 10))
from_5_to_10 = list(islice(numbers, 5, 10))
every_10th = list(islice(numbers, 0, 100, 10))

# Practical usage
def paginate_results(results, page_size, page_number):
    """Paginate iterator results."""
    start = page_size * (page_number - 1)
    return islice(results, start, start + page_size)
```

## Common Use Cases

### 1. Data Processing Pipelines

```python
def process_data_stream(data_stream):
    """Process a stream of data with multiple transformations."""
    return chain.from_iterable(
        filter(None,
            map(process_item,
                dropwhile(is_header, data_stream)
            )
        )
    )

def batch_processor(items, batch_size=100):
    """Process items in batches."""
    iterator = iter(items)
    return iter(lambda: list(islice(iterator, batch_size)), [])
```

### 2. Custom Iterators

```python
class TimeSeriesIterator:
    """Iterator for time series data with sliding window."""
    def __init__(self, data, window_size):
        self.data = data
        self.window_size = window_size

    def __iter__(self):
        return self

    def __next__(self):
        window = list(islice(self.data, self.window_size))
        if len(window) < self.window_size:
            raise StopIteration
        return window
```

### 3. Memory-Efficient Operations

```python
def find_combinations(items, r):
    """Memory-efficient combination generator."""
    return filter(
        is_valid_combination,
        combinations(items, r)
    )

def process_large_file(filename, chunk_size=1024):
    """Process large file in chunks."""
    with open(filename, 'rb') as f:
        return iter(lambda: f.read(chunk_size), b'')
```

## Performance Optimization

### Memory Usage

```python
def memory_efficient_processing():
    # Bad: Creates full list in memory
    result = list(map(process, range(1000000)))

    # Good: Process items one at a time
    result_iter = map(process, range(1000000))
    for item in result_iter:
        process_item(item)

def large_cartesian_product(sequences):
    """Memory-efficient cartesian product."""
    return map(lambda x: tuple(x), product(*sequences))
```

### Computation Optimization

```python
def optimize_filtering():
    # Less efficient
    result = filter(is_valid, filter(is_relevant, items))

    # More efficient
    def combined_check(x):
        return is_relevant(x) and is_valid(x)
    result = filter(combined_check, items)

def optimize_mapping():
    # Less efficient
    result = map(second_transform, map(first_transform, items))

    # More efficient
    def combined_transform(x):
        return second_transform(first_transform(x))
    result = map(combined_transform, items)
```

## Best Practices

### 1. Iterator Exhaustion

```python
def safe_iterator_usage():
    # Bad: Multiple traversals
    items = filter(pred, data)
    count = sum(1 for _ in items)  # Exhausts iterator
    processed = list(items)  # Nothing left to process

    # Good: Create new iterators or cache if needed
    items = list(filter(pred, data))  # Cache if needed multiple times
    count = sum(1 for _ in items)
    processed = list(items)
```

### 2. Combining Operations

```python
def efficient_combination():
    # Less readable, multiple iterations
    result = list(filter(None, map(process, filter(is_valid, items))))

    # More readable, single iteration
    def process_if_valid(x):
        return process(x) if is_valid(x) else None
    result = list(filter(None, map(process_if_valid, items)))
```

### 3. Error Handling

```python
def safe_iterator_processing(iterator):
    """Safely process iterator with error handling."""
    try:
        while True:
            try:
                item = next(iterator)
                process_item(item)
            except ValueError:
                continue  # Skip invalid items
    except StopIteration:
        pass
```

Remember:

- Use itertools for memory-efficient operations
- Chain operations for better performance
- Handle iterator exhaustion properly
- Consider memory usage for large datasets
- Use appropriate combinatoric functions
- Leverage infinite iterators carefully
- Implement proper error handling
