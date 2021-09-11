# Models:

- User (modify)
- Event
- Post
- Group
- Organization
- Paper
- Subject
- Chat
- Message
- Notification

# Routing:

- In `routes > web.php`:
  `Route::{method}('{uri}', {controller}@{function});`

| {URI}                             | {method} | {controller}@{function} > {view}     |
| --------------------------------- | -------- | ------------------------------------ |
| /                                 | get      | PagesController@index > pages.index  |
| /login                            | get      | LoginController@create > pages.login |
| /login/submit                     | post     | LoginController@show > pages.profile |
| /signup                           | get      | SignupController > signup            |
| /profile/{{user->id}}             | get      | users.show                           |
| /event                            | get      | event.index                          |
| /event/{{event->id}}              | get      | events.show                          |
| /profile/{{user->id}}/settings    | get      | users.settings                       |
| /profile/{{user->id}}/chats       | get      | chats.index                          |
| /group                            | get      | groups.index                         |
| /group/{{group->id}}/             | get      | groups.show                          |
| /group/{{group->id}}/{{post->id}} | get      | groups.show                          |
| /post/<post_id>/new_comment       |          |                                      |
| /post/new                         |          |                                      |
| /search/<search_query>            |          |                                      |
