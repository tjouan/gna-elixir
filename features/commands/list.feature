Feature: `list' command

  Scenario: lists repositories currently registered in run control file
    Given a file named .gna.rc with:
      """
      foo
      bar
      """
    When I run the program with argument list
    Then the output must contain exactly:
      """
      foo
      bar
      """
