# Adventure.rb
require 'sinatra'
require 'sinatra/reloader'
require 'haml'
require 'mongo'
require 'json'

# Game Dynamic "Model"
$data = {} 

# enable cookies
enable :sessions

before do
	# connect to mongo
	$connection = Mongo::Connection.new("192.168.0.180")
	$db = $connection.db("adventure")
	if ! $db.authenticate("crud", "382600")
		puts "problem"
	end
	$game = $db.collection("game")
end
after do
	# disconnect mongo
end

get '/' do
	redirect '/id/'
end

get '/id/:session?' do
	if ! params[:session] && ! session[:id]
		# if both cookie AND url not set
		#Game::Setup.Data	# setup default $data
		id = $game.insert($data)
		session[:id] = id.to_s
		redirect '/id/' + id.to_s
	elsif ! params[:session]
		# if url not set
		redirect '/id/' + session[:id].to_s
	elsif ! session[:id]
		# if cookie not set
		session[:id] = params[:session]
	end
	
	# The point of this method is JUST to set the cookie.
			
	haml :index
end

get '/cookie' do
	session[:id]
end

post '/submit/:command' do
	redirect '/' unless session[:id]

	# Will attempt to get a row
	$data = $game.find_one("_id" => BSON::ObjectId.from_string(session[:id]))
	# Will now initilize game over top of $data
	#Game::Setup.Data
	#data[:results] = Game::Play.Parse params[:command]
end















get '/Admin' do
	# Top rated commands
end