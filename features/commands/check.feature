Feature: `check' command

  Background:
    Given a git repository in repositories/my_repo
    And the git repository in repositories/my_repo has remote git:my_repo
    And a file named .gna.rc with:
      """
      repositories/my_repo
      """

  Scenario: reports nothing when all checks pass
    When I successfully run the program with argument check
    Then the output must be empty

  Scenario: reports repositories whose current branch is not master
    Given the git repository in repositories/my_repo has current branch foo
    When I successfully run the program with argument check
    Then the output must contain "repositories/my_repo"
    And the output must contain "foo"
