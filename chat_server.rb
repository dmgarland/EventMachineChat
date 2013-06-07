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

  # TODO: Create a Client and map it to our connection by
  # adding it to the clients hash, using the connection as the key
  def add_client(ws)
  end

  # TODO: Remove the client from our connection and broadcats an announcement that
  # someone left
  def remove_client(ws)
  end

  # Sends the given message down the web socket
  def transmit(ws, msg)
    ws.send msg
  end

  # TODO: Cycle through the clients and send the given message to them
  def broadcast(msg)
  end

  # TODO: Handles a message such as "join @dmgarland", by adding the
  # new client and broadcasting a welcome message to the room
  def handle_join(ws, name)
  end

  # TODO: Handles a message such as "say hello there", by
  def handle_say(ws, msg)
  end

  # The actual evented reactor code
  def start
    puts "ChatServer starting, listening on #{HOST}:#{PORT}"

    EventMachine::WebSocket.start(:host => HOST, :port => PORT) do |ws|
      ws.onopen {
        add_client(ws)
      }

      ws.onmessage { |msg|
        puts msg
      }

      ws.onclose {
        remove_client(ws)
      }
    end
  end
end

# Actually kick-off the EventMachine reactor
ChatServer.new.start