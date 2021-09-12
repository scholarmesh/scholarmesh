## Models

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

## Routing

In `routes > web.php`, add these lines:

`use App\Http\Controllers\{controller};`  
`Route::{method}('{uri}', [{controller}::class, '{function}']);`

Note that the following gives an error in Laravel 8:
`Route::{method}('{uri}', {controller}@{function});`

| {uri}                       | {method} | {controller}@{function} > {returning_view}          |
| --------------------------- | -------- | --------------------------------------------------- |
| /                           | get      | PagesController@index > pages.index                 |
| /login                      | get      | PagesController@login> pages.login                  |
| /signup                     | get      | PagesController@signup> pages.signup                |
| /profile/{profile}          | get      | UsersController@show > pages.users.show             |
| /profile/{profile}/settings | get      | UsersController@edit > pages.users.settings         |
| /events                     | get      | EventsController@index > pages.event.index          |
| /events/{event}             | get      | EventsController@show > pages.events.show           |
| /events/{event}/settings    | get      | EventsController@edit > pages.events.users.settings |
| /profile/{profile}/chats    | get      | ChatsController@index > pages.chats.index           |
| /groups                     | get      | GroupsController@index > pages.groups.index         |
| /groups/{group}/            | get      | GroupsController@index > pages.groups.show          |
| /group/{group}/{post}       | get      | PostsController@show > pages.posts.show             |
| /group/{group}/create-post  | get      | PostsController@create > pages.posts.create         |
| /search/{search}            | get      | SearchController@store > pages.search.result        |
