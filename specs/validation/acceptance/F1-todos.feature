Feature: F1 Todos

  @story-F1.1
  Rule: A signed-in user can add a todo with a short text title

    Scenario: Adding a todo
      Given Uma the user is signed in and has an empty list
      When Uma adds a todo titled "Buy milk"
      Then her list has exactly one todo
      And that todo is titled "Buy milk" and is not done

    @negative
    Scenario: A blank title is not accepted
      Given Uma the user is signed in and has an empty list
      When Uma tries to add a todo with an empty title
      Then her list still has no todos

  @story-F1.2
  Rule: The list shows the user's todos, newest first

    Scenario: Newest todo appears on top
      Given Uma the user is signed in and has an empty list
      And Uma adds a todo titled "Call the bank"
      When Uma adds a todo titled "Send invoice"
      Then her list shows "Send invoice" above "Call the bank"

  @story-F1.2
  Rule: A user sees only their own todos

    @negative
    Scenario: Another user's todos are not visible
      Given Uma the user has added a todo titled "Private errand"
      When Dan the user signs in and opens his list
      Then Dan's list does not contain "Private errand"

  @story-F1.3 @story-F1.4
  Rule: A user can mark a todo done and it stays in the list as done

    Scenario: Completing a todo
      Given Uma the user has a list with one todo titled "Buy milk"
      When Uma marks "Buy milk" as done
      Then her list still has exactly one todo
      And that todo is shown as done

  @story-F1.3
  Rule: Done is final

    @negative
    Scenario: A done todo cannot be reopened
      Given Uma the user has a list with one todo titled "Buy milk" that is done
      When Uma tries to mark "Buy milk" as not done
      Then that todo is still shown as done

  @story-F1.1
  Rule: Only a signed-in user can use the app

    @negative
    Scenario: A visitor who is not signed in
      Given a visitor who is not signed in
      When the visitor opens the app
      Then no todos are shown
