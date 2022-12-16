

"""
part of my software testing final was taking the cucumbers.py file, test_unit_basic.py, and unit_basic.feature file, and
simplly change the the names of cucumber to dragonfruit, and basket to container
"""


class DragonFruitContainer:

    def __init__(self, initial_count=0, max_count=10):
        if initial_count < 0:
            raise ValueError("Initial dragonfruit container count must not be negative")
        if max_count < 0:
            raise ValueError("Max dragonfruit container count must not be negative")

        self._count = initial_count
        self._max_count = max_count

    @property
    def count(self):
        return self._count

    @property
    def full(self):
        return self.count == self.max_count

    @property
    def empty(self):
        return self.count == 0

    @property
    def max_count(self):
        return self._max_count

    def add(self, count=1):
        new_count = self.count + count
        if new_count > self.max_count:
            raise ValueError("Attempted to add too many dragonfruits")
        self._count = new_count

    def remove(self, count=1):
        new_count = self.count - count
        if new_count < 0:
            raise ValueError("Attempted to remove too many dragonfruits")
        self._count = new_count