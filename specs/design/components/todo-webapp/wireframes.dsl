screen Todos "The signed-in user's todo list"
  navbar "Very Todo | Sign out"
  heading "My todos"
  row
    input "What needs doing?"
    button "Add" primary // adds in place; the list refreshes on the same screen
  list "Buy milk | Call the bank | Send invoice"
  row
    badge "Open" info
    text "Tap Done to complete a todo; done todos stay listed, struck through."
  row
    button "Done"
    badge "Done" success

flow "Manage todos"
  role "User"
  description "A signed-in user adds a todo and marks it done"
  Todos
