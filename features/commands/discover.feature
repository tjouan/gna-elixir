Feature: `discover' command

  Scenario: writes repositories discovered in given path to run control file
    Given a git repository in repositories/my_repo
    When I run the program with arguments discover repositories
    Then the file .gna.rc must contain exactly:
      """
      repositories/my_repo
      """
