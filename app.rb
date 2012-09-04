# Adventure.rb
require 'sinatra'
require 'sinatra/reloader'
require 'haml'

before do
	# connect to mongo
end
after do
	# disconnect mongo
end

get '/:session?' do
	#params[:session] if defined? params[:session]
	# new session
	@data = {:pi => [3,1,4,5,6]}
	haml :index
end

get '/Admin' do
	# Top rated commands
end

get '/submit/:command' do
	puts params[:command]
	"yo"
end