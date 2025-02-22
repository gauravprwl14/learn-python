# String Operations in Python

## Table of Contents

- [Basic String Operations](#basic-string-operations)
- [String Methods](#string-methods)
- [String Formatting](#string-formatting)
- [Regular Expression Operations](#regular-expression-operations)
- [Common Use Cases](#common-use-cases)
- [Performance Tips](#performance-tips)

## Basic String Operations

### String Operators

| Operator | Description    | Example              | Result          |
| -------- | -------------- | -------------------- | --------------- |
| `+`      | Concatenation  | `"Hello" + " World"` | `"Hello World"` |
| `*`      | Repetition     | `"Ha" * 3`           | `"HaHaHa"`      |
| `in`     | Membership     | `"lo" in "Hello"`    | `True`          |
| `not in` | Non-membership | `"x" not in "Hello"` | `True`          |
| `[]`     | Indexing       | `"Hello"[1]`         | `"e"`           |
| `[:]`    | Slicing        | `"Hello"[1:4]`       | `"ell"`         |
| `[::-1]` | Reverse        | `"Hello"[::-1]`      | `"olleH"`       |

### String Indexing and Slicing

| Operation       | Syntax              | Example         | Result    |
| --------------- | ------------------- | --------------- | --------- |
| First character | `s[0]`              | `"Hello"[0]`    | `"H"`     |
| Last character  | `s[-1]`             | `"Hello"[-1]`   | `"o"`     |
| Substring       | `s[start:end]`      | `"Hello"[1:4]`  | `"ell"`   |
| Step slicing    | `s[start:end:step]` | `"Hello"[::2]`  | `"Hlo"`   |
| Negative step   | `s[::-1]`           | `"Hello"[::-1]` | `"olleH"` |

## String Methods

### Case Operations

| Method         | Description             | Example                 | Result          |
| -------------- | ----------------------- | ----------------------- | --------------- |
| `upper()`      | Convert to uppercase    | `"Hello".upper()`       | `"HELLO"`       |
| `lower()`      | Convert to lowercase    | `"Hello".lower()`       | `"hello"`       |
| `capitalize()` | Capitalize first letter | `"hello".capitalize()`  | `"Hello"`       |
| `title()`      | Title case              | `"hello world".title()` | `"Hello World"` |
| `swapcase()`   | Swap case               | `"Hello".swapcase()`    | `"hELLO"`       |
| `casefold()`   | Aggressive lowercase    | `"ß".casefold()`        | `"ss"`          |

### Search and Replace

| Method      | Description                    | Example                     | Result    |
| ----------- | ------------------------------ | --------------------------- | --------- |
| `find()`    | Find substring                 | `"Hello".find("l")`         | `2`       |
| `rfind()`   | Find from right                | `"Hello".rfind("l")`        | `3`       |
| `index()`   | Find substring (raises error)  | `"Hello".index("l")`        | `2`       |
| `rindex()`  | Find from right (raises error) | `"Hello".rindex("l")`       | `3`       |
| `replace()` | Replace substring              | `"Hello".replace("l", "L")` | `"HeLLo"` |
| `count()`   | Count occurrences              | `"Hello".count("l")`        | `2`       |

### Strip and Split

| Method         | Description             | Example                  | Result          |
| -------------- | ----------------------- | ------------------------ | --------------- |
| `strip()`      | Remove whitespace       | `" Hello ".strip()`      | `"Hello"`       |
| `lstrip()`     | Remove left whitespace  | `" Hello ".lstrip()`     | `"Hello "`      |
| `rstrip()`     | Remove right whitespace | `" Hello ".rstrip()`     | `" Hello"`      |
| `split()`      | Split string            | `"Hi,Bye".split(",")`    | `["Hi", "Bye"]` |
| `rsplit()`     | Split from right        | `"Hi,Bye".rsplit(",")`   | `["Hi", "Bye"]` |
| `splitlines()` | Split lines             | `"Hi\nBye".splitlines()` | `["Hi", "Bye"]` |

### Join and Combine

| Method         | Description          | Example                       | Result                  |
| -------------- | -------------------- | ----------------------------- | ----------------------- |
| `join()`       | Join strings         | `",".join(["Hi", "Bye"])`     | `"Hi,Bye"`              |
| `partition()`  | Partition string     | `"Hi-Bye".partition("-")`     | `("Hi", "-", "Bye")`    |
| `rpartition()` | Partition from right | `"Hi-Bye-Hi".rpartition("-")` | `("Hi-Bye", "-", "Hi")` |

### Check String Content

| Method      | Description        | Example                   | Result |
| ----------- | ------------------ | ------------------------- | ------ |
| `isalpha()` | Check alphabetic   | `"Hello".isalpha()`       | `True` |
| `isdigit()` | Check digits       | `"123".isdigit()`         | `True` |
| `isalnum()` | Check alphanumeric | `"Hello123".isalnum()`    | `True` |
| `isspace()` | Check whitespace   | `" ".isspace()`           | `True` |
| `istitle()` | Check title case   | `"Hello World".istitle()` | `True` |
| `isupper()` | Check uppercase    | `"HELLO".isupper()`       | `True` |
| `islower()` | Check lowercase    | `"hello".islower()`       | `True` |

## String Formatting

### Format Types

| Method       | Example                    | Result          |
| ------------ | -------------------------- | --------------- |
| f-strings    | `f"Hello {name}!"`         | `"Hello John!"` |
| `.format()`  | `"Hello {}!".format(name)` | `"Hello John!"` |
| `%` operator | `"Hello %s!" % name`       | `"Hello John!"` |

### Format Specifiers

| Specifier | Description     | Example                    | Result         |
| --------- | --------------- | -------------------------- | -------------- |
| `{:d}`    | Integer         | `"{:d}".format(42)`        | `"42"`         |
| `{:f}`    | Float           | `"{:f}".format(3.14)`      | `"3.140000"`   |
| `{:.2f}`  | Float precision | `"{:.2f}".format(3.14159)` | `"3.14"`       |
| `{:>10}`  | Right align     | `"{:>10}".format("Hi")`    | `"        Hi"` |
| `{:<10}`  | Left align      | `"{:<10}".format("Hi")`    | `"Hi        "` |
| `{:^10}`  | Center align    | `"{:^10}".format("Hi")`    | `"    Hi    "` |

## Common Use Cases

### Text Processing

```python
def clean_text(text: str) -> str:
    """Clean and normalize text."""
    return text.strip().lower()

def split_and_clean(text: str, delimiter: str = ",") -> list:
    """Split text and clean each part."""
    return [part.strip() for part in text.split(delimiter)]

def snake_to_camel(text: str) -> str:
    """Convert snake_case to camelCase."""
    components = text.split('_')
    return components[0] + ''.join(x.title() for x in components[1:])
```

### Text Validation

```python
def is_valid_email(email: str) -> bool:
    """Basic email validation."""
    return (
        '@' in email
        and email.count('@') == 1
        and not email.startswith('@')
        and not email.endswith('@')
        and '.' in email.split('@')[1]
    )

def contains_number(text: str) -> bool:
    """Check if text contains number."""
    return any(char.isdigit() for char in text)

def is_strong_password(password: str) -> bool:
    """Check password strength."""
    return (
        len(password) >= 8
        and any(c.isupper() for c in password)
        and any(c.islower() for c in password)
        and any(c.isdigit() for c in password)
        and any(not c.isalnum() for c in password)
    )
```

### String Manipulation

```python
def truncate(text: str, length: int, suffix: str = "...") -> str:
    """Truncate text to length with suffix."""
    if len(text) <= length:
        return text
    return text[:length - len(suffix)].rstrip() + suffix

def wrap_text(text: str, width: int = 80) -> str:
    """Wrap text to specified width."""
    words = text.split()
    lines = []
    current_line = []
    current_length = 0

    for word in words:
        if current_length + len(word) + len(current_line) <= width:
            current_line.append(word)
            current_length += len(word)
        else:
            lines.append(" ".join(current_line))
            current_line = [word]
            current_length = len(word)

    if current_line:
        lines.append(" ".join(current_line))

    return "\n".join(lines)
```

## Performance Tips

### String Concatenation

```python
# Good - Using join
pieces = ["Hello", "World", "!"]
result = " ".join(pieces)

# Bad - Using + operator in loop
result = ""
for piece in pieces:
    result += piece + " "  # Creates new string each time

# Good - Using list comprehension and join
words = [word.capitalize() for word in text.split()]
result = " ".join(words)

# Bad - Multiple replacements with +
text = text.replace("a", "A") + text.replace("b", "B")
```

### String Searching

```python
# Good - Using in operator
if "@" in email:
    process_email(email)

# Bad - Using find
if email.find("@") != -1:
    process_email(email)

# Good - Using startswith/endswith
if filename.endswith((".jpg", ".png")):
    process_image(filename)

# Bad - Using slicing
if filename[-4:] == ".jpg" or filename[-4:] == ".png":
    process_image(filename)
```

Remember:

- String objects are immutable
- Use appropriate string methods for the task
- Consider using string views for large strings
- Use join() for concatenating multiple strings
- Use f-strings for modern string formatting
- Consider using regular expressions for complex patterns
