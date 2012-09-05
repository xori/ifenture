# Adventure.rb
require 'mongo'

# Game Dynamic "Model"
$data = {} 


# connect to mongo
$connection = Mongo::Connection.new("192.168.0.180")
$db = $connection.db("adventure")
if ! $db.authenticate("crud", "382600")
	puts "problem"
end
$game = $db.collection("game")
