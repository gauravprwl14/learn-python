# Numeric Operations in Python

## Table of Contents

- [Basic Arithmetic Operators](#basic-arithmetic-operators)
- [Number-Specific Functions](#number-specific-functions)
- [Math Module Functions](#math-module-functions)
- [Numeric Type Conversion](#numeric-type-conversion)
- [Advanced Operations](#advanced-operations)
- [Common Use Cases](#common-use-cases)
- [Performance Tips](#performance-tips)

## Basic Arithmetic Operators

### Operator Quick Reference

| Operator | Description    | Example  | Result      |
| -------- | -------------- | -------- | ----------- |
| `+`      | Addition       | `5 + 3`  | `8`         |
| `-`      | Subtraction    | `5 - 3`  | `2`         |
| `*`      | Multiplication | `5 * 3`  | `15`        |
| `/`      | Division       | `5 / 3`  | `1.6666...` |
| `//`     | Floor Division | `5 // 3` | `1`         |
| `%`      | Modulus        | `5 % 3`  | `2`         |
| `**`     | Exponentiation | `5 ** 3` | `125`       |

### Compound Assignment Operators

| Operator | Description             | Example   | Equivalent   |
| -------- | ----------------------- | --------- | ------------ |
| `+=`     | Add and assign          | `x += 3`  | `x = x + 3`  |
| `-=`     | Subtract and assign     | `x -= 3`  | `x = x - 3`  |
| `*=`     | Multiply and assign     | `x *= 3`  | `x = x * 3`  |
| `/=`     | Divide and assign       | `x /= 3`  | `x = x / 3`  |
| `//=`    | Floor divide and assign | `x //= 3` | `x = x // 3` |
| `%=`     | Modulus and assign      | `x %= 3`  | `x = x % 3`  |
| `**=`    | Power and assign        | `x **= 3` | `x = x ** 3` |

## Number-Specific Functions

### Built-in Numeric Functions

| Function    | Description           | Example         | Result   |
| ----------- | --------------------- | --------------- | -------- |
| `abs()`     | Absolute value        | `abs(-5)`       | `5`      |
| `round()`   | Round number          | `round(3.7)`    | `4`      |
| `pow()`     | Power                 | `pow(2, 3)`     | `8`      |
| `divmod()`  | Division and modulus  | `divmod(5, 2)`  | `(2, 1)` |
| `complex()` | Create complex number | `complex(1, 2)` | `1+2j`   |
| `int()`     | Convert to integer    | `int(3.14)`     | `3`      |
| `float()`   | Convert to float      | `float(3)`      | `3.0`    |

### Practical Examples

```python
# Working with financial calculations
def calculate_discount(price: float, discount_percent: float) -> float:
    """Calculate discounted price with rounding."""
    discount = price * (discount_percent / 100)
    return round(price - discount, 2)

# Working with divisions and remainders
def split_into_groups(total: int, group_size: int) -> tuple:
    """Return number of full groups and remainder."""
    return divmod(total, group_size)

# Complex number operations
def polar_to_complex(magnitude: float, angle: float) -> complex:
    """Convert polar coordinates to complex number."""
    import cmath
    return cmath.rect(magnitude, math.radians(angle))
```

## Math Module Functions

### Common Math Functions

| Function       | Description       | Example               | Result |
| -------------- | ----------------- | --------------------- | ------ |
| `math.ceil()`  | Round up          | `math.ceil(3.1)`      | `4`    |
| `math.floor()` | Round down        | `math.floor(3.9)`     | `3`    |
| `math.trunc()` | Truncate decimal  | `math.trunc(3.9)`     | `3`    |
| `math.sqrt()`  | Square root       | `math.sqrt(16)`       | `4.0`  |
| `math.log()`   | Natural logarithm | `math.log(math.e)`    | `1.0`  |
| `math.log10()` | Base-10 logarithm | `math.log10(100)`     | `2.0`  |
| `math.sin()`   | Sine              | `math.sin(math.pi/2)` | `1.0`  |
| `math.cos()`   | Cosine            | `math.cos(0)`         | `1.0`  |
| `math.tan()`   | Tangent           | `math.tan(math.pi/4)` | `1.0`  |

### Advanced Math Operations

```python
import math

def calculate_circle_properties(radius: float) -> dict:
    """Calculate various properties of a circle."""
    return {
        'area': math.pi * radius ** 2,
        'circumference': 2 * math.pi * radius,
        'diameter': 2 * radius
    }

def solve_quadratic(a: float, b: float, c: float) -> tuple:
    """Solve quadratic equation ax² + bx + c = 0."""
    discriminant = b**2 - 4*a*c
    if discriminant < 0:
        return None
    x1 = (-b + math.sqrt(discriminant)) / (2*a)
    x2 = (-b - math.sqrt(discriminant)) / (2*a)
    return x1, x2
```

## Numeric Type Conversion

### Type Conversion Table

| From          | To      | Function     | Example          | Result  |
| ------------- | ------- | ------------ | ---------------- | ------- |
| String        | Int     | `int()`      | `int("123")`     | `123`   |
| String        | Float   | `float()`    | `float("12.34")` | `12.34` |
| Float         | Int     | `int()`      | `int(12.34)`     | `12`    |
| Int           | Float   | `float()`    | `float(12)`      | `12.0`  |
| Int/Float     | Complex | `complex()`  | `complex(1, 2)`  | `1+2j`  |
| Binary String | Int     | `int(x, 2)`  | `int('1010', 2)` | `10`    |
| Hex String    | Int     | `int(x, 16)` | `int('A5', 16)`  | `165`   |

### Practical Conversion Examples

```python
def parse_numeric_input(value: str) -> Union[int, float]:
    """Parse string input to appropriate numeric type."""
    try:
        return int(value)
    except ValueError:
        try:
            return float(value)
        except ValueError:
            raise ValueError("Not a valid number")

def format_binary(number: int, width: int = 8) -> str:
    """Format number as binary string with fixed width."""
    return format(number, f'0{width}b')

def hex_to_rgb(hex_color: str) -> tuple:
    """Convert hex color to RGB tuple."""
    hex_color = hex_color.lstrip('#')
    return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))
```

## Advanced Operations

### Binary Operations

| Operation | Description | Example  | Result |
| --------- | ----------- | -------- | ------ |
| `&`       | Bitwise AND | `5 & 3`  | `1`    |
| `\|`      | Bitwise OR  | `5 \| 3` | `7`    |
| `^`       | Bitwise XOR | `5 ^ 3`  | `6`    |
| `~`       | Bitwise NOT | `~5`     | `-6`   |
| `<<`      | Left shift  | `5 << 1` | `10`   |
| `>>`      | Right shift | `5 >> 1` | `2`    |

### Example Applications

```python
def is_power_of_two(n: int) -> bool:
    """Check if number is power of 2 using bitwise."""
    return n > 0 and (n & (n - 1)) == 0

def get_bit(number: int, position: int) -> int:
    """Get bit value at position."""
    return (number >> position) & 1

def set_bit(number: int, position: int) -> int:
    """Set bit at position to 1."""
    return number | (1 << position)
```

## Common Use Cases

### Financial Calculations

```python
from decimal import Decimal, ROUND_HALF_UP

def calculate_total_with_tax(amount: float, tax_rate: float) -> float:
    """Calculate total amount including tax with proper rounding."""
    # Using
```
