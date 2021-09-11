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

| {url}                             | {controller} > {view}     |
| --------------------------------- | ------------------------- |
| /                                 | PagesController > home    |
| /login                            | LoginController > login   |
| /signup                           | SignupController > signup |
| /profile/{{user->id}}             | users.show                |
| /event                            | event.index               |
| /event/{{event->id}}              | events.show               |
| /profile/{{user->id}}/settings    | users.settings            |
| /profile/{{user->id}}/chats       | chats.index               |
| /group                            | groups.index              |
| /group/{{group->id}}/             | groups.show               |
| /group/{{group->id}}/{{post->id}} | groups.show               |
| /post/<post_id>/new_comment       |                           |
| /post/new                         |                           |
| /search/<search_query>            |                           |
