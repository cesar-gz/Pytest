import pytest
from cucumbers import CucumberBasket

# practice creating a simple unit test using pytest

def test_file1_method1():
    basket = CucumberBasket(initial_count = 2)
    basket.add(4)
    assert basket.count == 6, "--> Test failed. Basket does not countain 6 cucumbers"
