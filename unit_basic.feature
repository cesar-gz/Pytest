@unit @container
Feature: Dragonfruit Container
  As a gardener,
  I want to carry dragonfruits in a container,
  So that I don't drop them all.

  # Gherkin-based automation frameworks *can* be used for unit testing.
  # However, they are better suited for integration and end-to-end testing.
  # This feature file does unit testing for the sake of illustrating Gherkin usage.

  @add
  Scenario: Add dragonfruits to a container
    Given the container has "2" dragonfruits
    When "4" dragonfruits are added to the container
    Then the container contains "6" dragonfruits

  @add @full
  Scenario: Fill the container with dragonfruits
    Given the container is empty
    When "10" dragonfruits are added to the container
    Then the container is full

  @add @error
  Scenario: Overfill the container with dragonfruits
    Given the container has "8" dragonfruits
    Then "3" dragonfruits cannot be added to the container

  @remove
  Scenario: Remove dragonfruits from the container
    Given the container has "8" dragonfruits
    When "3" dragonfruits are removed from the container
    Then the container contains "5" dragonfruits

  @remove @empty
  Scenario: Empty the container of all dragonfruits
    Given the container is full
    When "10" dragonfruits are removed from the container
    Then the container is empty

  @remove @error
  Scenario: Remove too many dragonfruits from the container
    Given the container has "1" dragonfruit
    Then "2" dragonfruits cannot be removed from the container

  @add @remove
  Scenario: Add and remove dragonfruits
    Given the container is empty
    When "4" dragonfruits are added to the container
    And "6" more dragonfruits are added to the container
    But "3" dragonfruits are removed from the container
    Then the container contains "7" dragonfruits