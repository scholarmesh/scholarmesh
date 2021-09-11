# Models:

- User (modify)
- Event
- Post
- Group
- Organization
- Paper
- Subject
- Chatroom
- Message
- Notification

# Routing:

- In `routes > web.php`:
  `Route::{method}('{url}', {controller}@{function});`
- In `app > Http > Controllers > {controller}.php`, within the controller class body, at the end of the specified function body:
  `return view('{view}');`

| {URI}                             | {method} | {controller}@{function} > {view} |
| --------------------------------- | -------- | -------------------------------- |
| /                                 | get      | PagesController @index > home    |
| /login                            | get      | LoginController > login          |
| /signup                           | get      | SignupController > signup        |
| /profile/{{user->id}}             | get      | users.show                       |
| /event                            | get      | event.index                      |
| /event/{{event->id}}              | get      | events.show                      |
| /profile/{{user->id}}/settings    | get      | users.settings                   |
| /profile/{{user->id}}/chats       | get      | chats.index                      |
| /group                            | get      | groups.index                     |
| /group/{{group->id}}/             | get      | groups.show                      |
| /group/{{group->id}}/{{post->id}} | get      | groups.show                      |
| /post/<post_id>/new_comment       |          |                                  |
| /post/new                         |          |                                  |
| /search/<search_query>            |          |                                  |
