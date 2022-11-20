from bubblesort import bubbleSort, nList
import random

def test_random_values():
    list = []
    for x in range(15):
        randomNumber = random.randint(0, 9)
        list.append(randomNumber)
    newList = sorted(list)
    bubbleSort(list)
    assert(newList == list)

def test_not_empty():
    list = []
    for x in range(15):
        randomNumber = random.randint(0, 9)
        list.append(randomNumber)
    bubbleSort(list)
    assert len(list) > 0

def test_contains_too_little():
    list = []
    for x in range(15):
        randomNumber = random.randint(0, 9)
        list.append(randomNumber)
    bubbleSort(list)
    assert len(list) <= 14 , "There are less than 15 elements in this list"
