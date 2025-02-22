"""
Understanding Python's Internal Architecture
- Memory Management
- Reference Counting
- Garbage Collection
- Global Interpreter Lock (GIL)
"""

import gc
import sys
import threading
from typing import Any, Dict
from weakref import WeakKeyDictionary


class MemoryManager:
    """Demonstrates Python's memory management concepts"""

    def __init__(self):
        self._cache: Dict[Any, Any] = WeakKeyDictionary()
        self._ref_counts = {}

    def demonstrate_reference_counting(self):
        """Shows how Python handles reference counting"""
        # Create an object and track its references
        obj = ["example"]
        self._ref_counts[id(obj)] = sys.getrefcount(obj)

        # Create another reference
        ref2 = obj
        self._ref_counts[id(obj)] = sys.getrefcount(obj)

        return self._ref_counts

    @staticmethod
    def demonstrate_gil():
        """Shows GIL's impact on threading"""

        def cpu_bound_task(n):
            while n > 0:
                n -= 1

        # Create two threads for CPU-bound tasks
        t1 = threading.Thread(target=cpu_bound_task, args=(10**7,))
        t2 = threading.Thread(target=cpu_bound_task, args=(10**7,))

        return t1, t2

    def optimize_memory(self):
        """Demonstrates memory optimization techniques"""

        # Use slots to reduce memory footprint
        class OptimizedClass:
            __slots__ = ["x", "y"]

            def __init__(self, x, y):
                self.x = x
                self.y = y

        # Demonstrate object pooling
        class ObjectPool:
            _pool = []

            @classmethod
            def acquire(cls):
                return cls._pool.pop() if cls._pool else OptimizedClass(0, 0)

            @classmethod
            def release(cls, obj):
                cls._pool.append(obj)

        return OptimizedClass, ObjectPool


if __name__ == "__main__":
    mm = MemoryManager()
    ref_counts = mm.demonstrate_reference_counting()
    print(f"Reference counts: {ref_counts}")

    # Demonstrate GIL impact
    t1, t2 = mm.demonstrate_gil()
    t1.start()
    t2.start()
    t1.join()
    t2.join()
