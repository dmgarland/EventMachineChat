# EventMachine Chat Server

A little chat server using event machine

## SETUP

* Fork, clone and cd into the project directory as usual
* bundle
* Split your terminal in two, and run the following commands in either:
```ruby web_server.rb```
```ruby chat_server.rb```
* Visit http://localhost:4567 in your browser

## TODO

* Implement the TODO methods in the chat_server.rb, so that you can get a basic chat system running
* Add the following chat commands:

| Command   | Args       | Description|
|:----------|:-----------|:-----------|
| hug       | name of a client | Prints out {{{{{{{{{{ Name }}}}}}}}}} |
| think     | message | Print out a message prefixed with #{name} thinks #{message} in italics |
| quit      | n/a | Disconnect the client and broadcast a message to other users |
| kick      | name of a client | Removes a client from the server and closes their connection |
| bomb      | message    | prints down numbers from 10 to zero once a second, then prints the message |

* Make any UI enchancements that you see fit. Maybe fix that annoying bug that submits the form rather than sending using Javascript when you press enter in the box.