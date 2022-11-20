# making sure pytest runs
def test_file1_method1():
    x = 5
    y = 6
    assert x == y, "If this prints, then the test failed"

def test_file2_method1():
    x = 5
    y = 6
    assert x + 1 == y, "If this prints, then the test failed"