# Collections Module Operations in Python

## Table of Contents

- [Counter](#counter)
- [defaultdict](#defaultdict)
- [deque](#deque)
- [namedtuple](#namedtuple)
- [OrderedDict](#ordereddict)
- [ChainMap](#chainmap)
- [UserDict, UserList, UserString](#user-collections)
- [Common Use Cases](#common-use-cases)
- [Performance Considerations](#performance-considerations)

## Counter

### Basic Operations

```python
from collections import Counter

# Creation methods
counter = Counter(['a', 'b', 'c', 'a', 'b', 'a'])
word_counter = Counter('mississippi')
dict_counter = Counter({'a': 3, 'b': 2})
kwarg_counter = Counter(a=3, b=2)
```

### Counter Methods

| Method             | Description            | Example                       | Result                  |
| ------------------ | ---------------------- | ----------------------------- | ----------------------- |
| `elements()`       | Iterator over elements | `Counter('AABBC').elements()` | `['A','A','B','B','C']` |
| `most_common([n])` | n most common elements | `counter.most_common(2)`      | `[('a',3), ('b',2)]`    |
| `subtract()`       | Subtract counts        | `counter.subtract(['a','b'])` | Updates counter         |
| `update()`         | Add counts             | `counter.update(['a','b'])`   | Updates counter         |

```python
# Common operations
counter1 = Counter(['a', 'b', 'c', 'a'])
counter2 = Counter(['b', 'c', 'd'])

# Mathematical operations
sum_counter = counter1 + counter2  # Add counts
diff_counter = counter1 - counter2  # Subtract counts
intersection = counter1 & counter2  # Minimum of each count
union = counter1 | counter2        # Maximum of each count

# Practical example
def analyze_text(text):
    """Analyze word frequencies in text."""
    words = text.lower().split()
    word_counts = Counter(words)
    return {
        'most_common': word_counts.most_common(5),
        'total_words': sum(word_counts.values()),
        'unique_words': len(word_counts)
    }
```

## defaultdict

### Basic Usage

```python
from collections import defaultdict

# Different default factories
int_dict = defaultdict(int)       # Default: 0
list_dict = defaultdict(list)     # Default: []
set_dict = defaultdict(set)       # Default: set()
str_dict = defaultdict(str)       # Default: ''

# Custom default factory
def custom_default():
    return {'count': 0, 'value': None}
custom_dict = defaultdict(custom_default)
```

### Common Patterns

```python
# Grouping items
def group_by_key(items, key_func):
    groups = defaultdict(list)
    for item in items:
        groups[key_func(item)].append(item)
    return dict(groups)

# Counting with default
def count_items(items):
    counts = defaultdict(int)
    for item in items:
        counts[item] += 1
    return dict(counts)

# Nested defaultdict
def nested_default():
    return defaultdict(int)
nested = defaultdict(nested_default)
nested['a']['b'] += 1  # No KeyError
```

## deque

### Creation and Basic Operations

```python
from collections import deque

# Creation
d = deque([1, 2, 3, 4, 5])
max_size = deque([1, 2, 3], maxlen=3)
```

### Deque Methods

| Method         | Description       | Example              | Notes        |
| -------------- | ----------------- | -------------------- | ------------ |
| `append()`     | Add to right      | `d.append(x)`        | O(1)         |
| `appendleft()` | Add to left       | `d.appendleft(x)`    | O(1)         |
| `pop()`        | Remove from right | `d.pop()`            | O(1)         |
| `popleft()`    | Remove from left  | `d.popleft()`        | O(1)         |
| `rotate()`     | Rotate elements   | `d.rotate(n)`        | Right if n>0 |
| `extend()`     | Extend right      | `d.extend(iter)`     | Add multiple |
| `extendleft()` | Extend left       | `d.extendleft(iter)` | Add multiple |

```python
# Implementation examples
class RingBuffer:
    """Fixed-size ring buffer implementation."""
    def __init__(self, size):
        self.buffer = deque(maxlen=size)

    def append(self, item):
        self.buffer.append(item)

    def get_all(self):
        return list(self.buffer)

class MovingAverage:
    """Calculate moving average of last n numbers."""
    def __init__(self, size):
        self.numbers = deque(maxlen=size)

    def add(self, number):
        self.numbers.append(number)
        return self.average()

    def average(self):
        return sum(self.numbers) / len(self.numbers) if self.numbers else 0
```

## namedtuple

### Creation Methods

```python
from collections import namedtuple

# Basic creation
Point = namedtuple('Point', ['x', 'y'])
Person = namedtuple('Person', 'name age city')  # Space-separated string

# With defaults
Employee = namedtuple('Employee', ['name', 'salary'], defaults=['Unknown', 0])

# With field rename
Card = namedtuple('Card', ['rank', 'suit', 'rank'], rename=True)  # Duplicate 'rank' renamed
```

### Operations and Methods

```python
# Creation and access
point = Point(3, 4)
print(point.x)        # Field access
x, y = point         # Unpacking
point_dict = point._asdict()  # Convert to dict

# Modification
new_point = point._replace(x=5)  # Create new instance with changes

# Field information
print(Point._fields)        # Field names
print(Point._field_defaults)  # Default values

# Example: Data processing
class DataPoint:
    def __init__(self, fields):
        self.Record = namedtuple('Record', fields)

    def create_record(self, values):
        return self.Record(*values)

    def process_records(self, data):
        return [self.create_record(row) for row in data]
```

## OrderedDict

### Basic Usage

```python
from collections import OrderedDict

# Creation
od = OrderedDict([('a', 1), ('b', 2), ('c', 3)])
od = OrderedDict(sorted([('b', 2), ('a', 1), ('c', 3)]))

# Operations
od.move_to_end('b')         # Move to end
od.move_to_end('b', False)  # Move to beginning
od.popitem()                # Remove last item
od.popitem(False)           # Remove first item
```

### Common Patterns

```python
# LRU Cache implementation
class LRUCache:
    def __init__(self, capacity):
        self.cache = OrderedDict()
        self.capacity = capacity

    def get(self, key):
        if key not in self.cache:
            return -1
        self.cache.move_to_end(key)
        return self.cache[key]

    def put(self, key, value):
        if key in self.cache:
            self.cache.move_to_end(key)
        self.cache[key] = value
        if len(self.cache) > self.capacity:
            self.cache.popitem(last=False)
```

## ChainMap

### Basic Operations

```python
from collections import ChainMap

# Creation
defaults = {'color': 'red', 'user': 'guest'}
user_prefs = {'color': 'blue'}
combined = ChainMap(user_prefs, defaults)

# Access and updates
print(combined['color'])     # Returns 'blue'
combined['color'] = 'green'  # Updates first mapping
```

### Common Use Cases

```python
def get_config():
    """Configuration with multiple fallback levels."""
    defaults = {
        'debug': False,
        'port': 8000,
        'host': 'localhost'
    }

    env_vars = {
        k.lower(): v
        for k, v in os.environ.items()
        if k.startswith('APP_')
    }

    args = parse_arguments()
    return ChainMap(args, env_vars, defaults)

# Command line argument handling
def parse_cli():
    cli_args = {}
    defaults = {}
    return ChainMap(cli_args, os.environ, defaults)
```

## Common Use Cases

### 1. Data Processing

```python
def process_log_entries(logs):
    """Process log entries with various collectors."""
    # Count events by type
    event_counts = Counter(entry['event'] for entry in logs)

    # Group by user
    user_events = defaultdict(list)
    for entry in logs:
        user_events[entry['user']].append(entry)

    # Recent events queue
    recent_events = deque(maxlen=100)
    for entry in logs:
        recent_events.append(entry)

    return {
        'counts': event_counts,
        'by_user': dict(user_events),
        'recent': list(recent_events)
    }
```

### 2. Data Structure Implementations

```python
def implement_cache(size):
    """Implement a simple cache with size limit."""
    cache = OrderedDict()

    def get(key):
        if key not in cache:
            return None
        cache.move_to_end(key)
        return cache[key]

    def put(key, value):
        if key in cache:
            cache.move_to_end(key)
        cache[key] = value
        if len(cache) > size:
            cache.popitem(last=False)

    return get, put
```

### 3. Configuration Management

```python
def create_config_manager():
    """Create a configuration manager with multiple layers."""
    defaults = {
        'debug': False,
        'host': 'localhost',
        'port': 8000
    }

    user_config = {}
    runtime_config = {}

    config = ChainMap(runtime_config, user_config, defaults)

    def update_runtime(key, value):
        runtime_config[key] = value

    def update_user(key, value):
        user_config[key] = value

    return config, update_runtime, update_user
```

## Performance Considerations

### Time Complexity Comparison

| Collection  | Operation     | Complexity | Notes              |
| ----------- | ------------- | ---------- | ------------------ |
| Counter     | most_common() | O(n log n) | Sorting required   |
| defaultdict | Access        | O(1)       | Hash table         |
| deque       | append/pop    | O(1)       | Both ends          |
| OrderedDict | move_to_end   | O(1)       | Doubly-linked      |
| ChainMap    | Access        | O(n)       | n = number of maps |

### Memory Usage

```python
def compare_memory_usage():
    """Compare memory usage of different collections."""
    import sys

    # Regular dict vs defaultdict
    d = dict()
    dd = defaultdict(list)

    # Regular list vs deque
    l = list(range(1000))
    dq = deque(range(1000))

    # Regular tuple vs namedtuple
    t = (1, 2, 3)
    Point = namedtuple('Point', ['x', 'y', 'z'])
    nt = Point(1, 2, 3)

    return {
        'dict': sys.getsizeof(d),
        'defaultdict': sys.getsizeof(dd),
        'list': sys.getsizeof(l),
        'deque': sys.getsizeof(dq),
        'tuple': sys.getsizeof(t),
        'namedtuple': sys.getsizeof(nt)
    }
```

Remember:

- Choose appropriate collection type for your use case
- Consider memory implications for large datasets
- Use collection-specific operations for best performance
- Leverage specialized methods when available
- Consider thread safety requirements
- Use type hints for better code clarity
