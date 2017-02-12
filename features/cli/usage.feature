Feature: Program usage

  Scenario: prints the usage when unknown option is given
    When I run the program with option --unkwnown-option
    Then the exit status must be 64
    And the output must contain exactly:
      """
      Usage: gna command [arguments]

      Commands:
        check           -- Display status for registered repositories
        discover path   -- Search and register repositories in `path' directory
        help            -- Display this message
        list            -- List registered repositories
      """

  Scenario: prints the usage when help command is given
    When I run the program with command help
    Then the program must terminate successfully
    And the output must contain exactly:
      """
      Usage: gna command [arguments]

      Commands:
        check           -- Display status for registered repositories
        discover path   -- Search and register repositories in `path' directory
        help            -- Display this message
        list            -- List registered repositories
      """
