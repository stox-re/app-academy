require 'socket'
require 'thread'
require 'json'

server = TCPServer.new(3000)
$cats = []

def handle_request(socket)
  Thread.new do
    cmd = socket.gets.chomp
    case cmd
    when "INDEX"
      socket.puts $cats.to_json
    when "CREATE"
      name = socket.gets.chomp
      $cats << { name: name }
    end
    # Pause here until someone tries to connect to the server
    #socket.puts("Thanks for connecting")
    #socket.puts("What is your name?")
    #name = socket.gets.chomp
    #socket.puts("Goodbye #{name}")
    socket.close
  end
  puts "Spawned worker thread"
end

while true
  socket = server.accept
  handle_request(socket)
end
