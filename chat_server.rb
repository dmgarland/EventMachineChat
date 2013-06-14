require 'em-websocket'
require 'pry'
require './lib/client'
require './chat_server'

class ChatServer

  HOST = "0.0.0.0"
  PORT = 8080
  attr_accessor :clients

  def initialize
    self.clients = {}
  end


  def add_client(ws)
    #establishes client conenction
    self.clients[ws] = Client.new(ws)
  end

  # TODO: Remove the client from our connection and broadcats an announcement that
  # someone left
  def remove_client(ws)
    self.clients.delete(ws)
  end

  # Sends the given message down the web socket
  def transmit(ws, msg)
     ws.send msg
  end

  # TODO: Cycle through the clients and send the given message to them
  # ws gives a key value pair
  def broadcast(msg)
     self.clients.each do |client|
      client.first.send msg
    end
  end

  # TODO: Handles a message such as "join @dmgarland", by adding the
  # new client and broadcasting a welcome message to the room
  def handle_join(ws, args)
    self.clients[ws].name = args.first
    msg = "#{args.first} has joined the room."
    broadcast(msg)

  end

  # TODO: Handles a message such as "say hello there", by
  def handle_Say(ws, args)
    user_msg = args.join(" ")
    msg = "#{self.clients[ws].name} says: #{user_msg}"
    broadcast(msg)
  end

  def handle_hug(ws, args)
    msg = "No such users"
    hug = args.join(" ")
    if clients[1].name.downcase == hug.downcase
      msg = "#{self.clients[ws].name} hugs #{hug}"
    end

    broadcast(msg)
  end
  # The actual evented reactor code
  def start
    puts "ChatServer starting, listening on #{HOST}:#{PORT}"

    EventMachine::WebSocket.start(:host => HOST, :port => PORT) do |ws|
      ws.onopen {
        add_client(ws)
      }

      ws.onmessage { |msg|
        command, *values = msg.split(" ")
        self.send("handle_#{command}", ws, values)
        # puts msg
      }

      ws.onclose {
        remove_client(ws)
      }
    end
  end
end

# Actually kick-off the EventMachine reactor
ChatServer.new.start