# Source file: https://github.com/AndyLPK247/behavior-driven-python/blob/master/pytest-bdd/tests/step_defs/test_unit_basic.py

"""
This module contains step definitions for unit_basic.feature.
Decorators for step definition functions are simplified using partials.
"""

from dragonfruit import DragonFruitContainer
from functools import partial
from pytest_bdd import scenarios, given, when, then, parsers


# Partial Step Helpers

CONVERTERS = {
    'initial': int,
    'some': int,
    'total': int,
}

given_container = partial(given, target_fixture='container', converters=CONVERTERS)
when_cukes = partial(when, converters=CONVERTERS)
then_cukes = partial(then, converters=CONVERTERS)


# Scenarios

scenarios('../features/unit_basic.feature')


# Given Steps

@given_container(parsers.re(r'the container has "(?P<initial>\d+)" dragonfruit(s?)'))
def container_init(initial):
    return DragonFruitContainer(initial_count=initial)


@given_container('the container is empty')
def container_empty():
    return DragonFruitContainer()


@given_container('the container is full')
def container_full():
    return DragonFruitContainer(initial_count=10)


# When Steps

@when_cukes(parsers.re(r'"(?P<some>\d+)"( more)? dragonfruit(s?) are added to the container'))
def add_dragonfruits(container, some):
    container.add(some)


@when_cukes(parsers.re(r'"(?P<some>\d+)"( more)? dragonfruit(s?) are removed from the container'))
def remove_dragonfruits(container, some):
    container.remove(some)


# Then Steps

@then_cukes(parsers.re(r'the container contains "(?P<total>\d+)" dragonfruits'))
def container_has_total(container, total):
    assert container.count == total


@then_cukes('the container is empty')
def container_is_empty(container):
    assert container.empty


@then_cukes('the container is full')
def container_is_full(container):
    assert container.full


@then_cukes(parsers.re(r'"(?P<some>\d+)" dragonfruits cannot be added to the container'))
def cannot_add_more(container, some):
    count = container.count
    try:
        container.add(some)
    except ValueError as e:
        assert str(e) == "Attempted to add too many dragonfruits"
        assert count == container.count, "Dragonfruit count changed despite overflow"
    except:
        assert False, "Exception raised for container overflow was not a ValueError"
    else:
        assert False, "ValueError was not raised for container overflow"


@then_cukes(parsers.re(r'"(?P<some>\d+)" dragonfruits cannot be removed from the container'))
def cannot_remove_more(container, some):
    count = container.count
    try:
        container.remove(some)
    except ValueError as e:
        assert str(e) == "Attempted to remove too many dragonfruits"
        assert count == container.count, "Dragonfruit count changed despite overdraw"
    except:
        assert False, "Exception raised for container overdraw was not a ValueError"
    else:
        assert False, "ValueError was not raised for container overdraw"
