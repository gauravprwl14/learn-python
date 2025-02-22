# Complex Data Structures and Operations

## Table of Contents

- [Nested Data Structures](#nested-data-structures)
- [Advanced Operations](#advanced-operations)
- [Real-World Examples](#real-world-examples)
- [Performance Considerations](#performance-considerations)
- [Common Pitfalls](#common-pitfalls)
- [Best Practices](#best-practices)

## Nested Data Structures

### 1. Nested Lists

```python
# Simple nested list
matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

# Accessing elements
element = matrix[1][2]  # Gets 6

# Complex nested list
deep_nested = [
    [1, [2, 3, [4, 5]], 6],
    [7, [8, [9, 10]], 11]
]

# Accessing deep nested elements
deep_element = deep_nested[1][1][1][0]  # Gets 9

# List comprehension with nested lists
flattened = [item for sublist in matrix for item in sublist]
```

### 2. Lists of Dictionaries

```python
users = [
    {
        "id": 1,
        "name": "John",
        "emails": ["john@work.com", "john@personal.com"],
        "address": {
            "street": "123 Main St",
            "city": "Boston",
            "country": "USA"
        }
    },
    {
        "id": 2,
        "name": "Alice",
        "emails": ["alice@company.com"],
        "address": {
            "street": "456 Park Ave",
            "city": "New York",
            "country": "USA"
        }
    }
]

# Complex filtering
us_users = [
    user for user in users
    if user["address"]["country"] == "USA"
]

# Extracting specific nested data
all_emails = [
    email
    for user in users
    for email in user["emails"]
]
```

### 3. Nested Dictionaries

```python
company = {
    "name": "Tech Corp",
    "departments": {
        "engineering": {
            "teams": {
                "frontend": {
                    "lead": "John",
                    "members": ["Alice", "Bob"],
                    "projects": ["Website", "Mobile App"]
                },
                "backend": {
                    "lead": "Sarah",
                    "members": ["Charlie", "David"],
                    "projects": ["API", "Database"]
                }
            },
            "budget": 1000000
        },
        "marketing": {
            "teams": {
                "digital": {
                    "lead": "Emma",
                    "members": ["Frank", "Grace"]
                }
            },
            "budget": 500000
        }
    }
}

# Safe nested access using get()
frontend_lead = company.get("departments", {}).\
                      get("engineering", {}).\
                      get("teams", {}).\
                      get("frontend", {}).\
                      get("lead")

# Using dictionary comprehension with nested data
team_sizes = {
    dept_name: len(dept.get("teams", {}))
    for dept_name, dept in company["departments"].items()
}
```

## Advanced Operations

### 1. Deep Copy vs Shallow Copy

```python
import copy

# Original nested structure
original = {
    "name": "Project X",
    "teams": ["Alpha", "Beta"],
    "details": {
        "started": "2024",
        "members": ["John", "Alice"]
    }
}

# Shallow copy
shallow = original.copy()
shallow["details"]["members"].append("Bob")  # Affects original

# Deep copy
deep = copy.deepcopy(original)
deep["details"]["members"].append("Charlie")  # Doesn't affect original
```

### 2. Advanced List Operations

```python
# Nested list manipulation
def flatten_list(nested_list):
    result = []
    for item in nested_list:
        if isinstance(item, list):
            result.extend(flatten_list(item))
        else:
            result.append(item)
    return result

# List comprehension with multiple conditions
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
even_coords = [
    (i, j, val)
    for i, row in enumerate(matrix)
    for j, val in enumerate(row)
    if val % 2 == 0
]
```

### 3. Dictionary Merging and Updates

```python
# Deep merge dictionaries
def deep_merge(dict1, dict2):
    result = dict1.copy()

    for key, value in dict2.items():
        if key in result and isinstance(result[key], dict) and isinstance(value, dict):
            result[key] = deep_merge(result[key], value)
        else:
            result[key] = copy.deepcopy(value)

    return result

# Example usage
config1 = {
    "server": {
        "host": "localhost",
        "ports": [8000, 8001]
    }
}

config2 = {
    "server": {
        "host": "127.0.0.1",
        "timeout": 30
    }
}

merged_config = deep_merge(config1, config2)
```

## Real-World Examples

### 1. API Response Handling

```python
def process_api_response(response_data):
    """Process nested API response data."""
    processed_data = []

    for item in response_data.get("items", []):
        # Extract nested information
        user_info = item.get("user", {})
        address = user_info.get("address", {})

        processed_data.append({
            "user_id": user_info.get("id"),
            "full_name": f"{user_info.get('first_name', '')} {user_info.get('last_name', '')}".strip(),
            "location": {
                "city": address.get("city"),
                "country": address.get("country")
            },
            "active_projects": [
                project.get("name")
                for project in item.get("projects", [])
                if project.get("status") == "active"
            ]
        })

    return processed_data
```

### 2. Configuration Management

```python
class ConfigManager:
    def __init__(self, default_config):
        self.config = default_config

    def update_config(self, new_config):
        """Deep update configuration."""
        def _update(d, u):
            for k, v in u.items():
                if isinstance(v, dict):
                    d[k] = _update(d.get(k, {}), v)
                else:
                    d[k] = v
            return d

        self.config = _update(self.config, new_config)

    def get_nested_value(self, path):
        """Get value using dot notation path."""
        current = self.config
        for key in path.split('.'):
            if not isinstance(current, dict):
                return None
            current = current.get(key)
        return current
```

## Performance Considerations

### 1. Memory Usage

```python
# Memory-efficient nested structure traversal
def process_large_nested_data(data, max_depth=None, current_depth=0):
    """Process nested data with memory constraints."""
    if max_depth is not None and current_depth >= max_depth:
        return

    if isinstance(data, dict):
        for key, value in data.items():
            yield (key, value)
            if isinstance(value, (dict, list)):
                yield from process_large_nested_data(
                    value,
                    max_depth,
                    current_depth + 1
                )
    elif isinstance(data, list):
        for item in data:
            yield item
            if isinstance(item, (dict, list)):
                yield from process_large_nested_data(
                    item,
                    max_depth,
                    current_depth + 1
                )
```

### 2. Time Complexity Optimization

```python
from collections import defaultdict

def optimize_nested_lookups(data):
    """Create lookup tables for faster access."""
    lookups = defaultdict(dict)

    def build_lookups(current_data, path=()):
        if isinstance(current_data, dict):
            for key, value in current_data.items():
                current_path = path + (key,)
                lookups[len(current_path)][current_path] = value
                build_lookups(value, current_path)
        elif isinstance(current_data, list):
            for i, item in enumerate(current_data):
                current_path = path + (i,)
                lookups[len(current_path)][current_path] = item
                build_lookups(item, current_path)

    build_lookups(data)
    return lookups
```

## Common Pitfalls

### 1. Mutable Default Arguments

```python
# Wrong way
def add_user(name, groups=[]):  # Mutable default argument!
    groups.append(name)
    return groups

# Correct way
def add_user(name, groups=None):
    if groups is None:
        groups = []
    groups.append(name)
    return groups
```

### 2. Reference vs Copy

```python
# Understanding reference behavior
def modify_nested_data(data):
    # Creates new reference, doesn't affect original
    local_data = data
    local_data["new_key"] = "new_value"

    # Modifies original data
    data["nested"]["key"] = "value"

    # Safe way to modify
    safe_data = copy.deepcopy(data)
    safe_data["nested"]["key"] = "new_value"
    return safe_data
```

## Best Practices

### 1. Accessing Nested Data

```python
# Using get() with default values
def safe_get_nested(data, keys, default=None):
    """Safely get nested value using key sequence."""
    current = data
    for key in keys:
        try:
            current = current.get(key, {})
        except AttributeError:
            return default
    return current if current != {} else default

# Example usage
user_city = safe_get_nested(
    user_data,
    ["address", "city"],
    default="Unknown"
)
```

### 2. Data Validation

```python
def validate_nested_structure(data, schema):
    """Validate nested data structure against schema."""
    if isinstance(schema, dict):
        if not isinstance(data, dict):
            return False
        return all(
            k in data and validate_nested_structure(data[k], v)
            for k, v in schema.items()
        )
    elif isinstance(schema, list):
        if not isinstance(data, list):
            return False
        return all(
            validate_nested_structure(item, schema[0])
            for item in data
        ) if schema else True
    else:
        return isinstance(data, schema)

# Example schema
user_schema = {
    "id": int,
    "name": str,
    "contacts": [{
        "type": str,
        "value": str
    }],
    "settings": {
        "notifications": bool,
        "theme": str
    }
}
```

### 3. Error Handling

```python
class NestedDataError(Exception):
    """Custom exception for nested data operations."""
    pass

def process_nested_data(data):
    """Process nested data with proper error handling."""
    try:
        if not isinstance(data, dict):
            raise NestedDataError("Expected dictionary")

        # Process first level
        for key, value in data.items():
            try:
                if isinstance(value, dict):
                    # Process nested dictionary
                    process_nested_dict(value)
                elif isinstance(value, list):
                    # Process nested list
                    process_nested_list(value)
            except Exception as e:
                raise NestedDataError(f"Error processing key '{key}': {str(e)}")

    except Exception as e:
        raise NestedDataError(f"Data processing failed: {str(e)}")
```

Remember: When working with complex nested data structures:

1. Always validate input data
2. Use safe access methods
3. Consider memory and performance implications
4. Handle errors appropriately
5. Document the expected structure
6. Use type hints when possible
7. Create helper functions for common operations
8. Test with edge cases
