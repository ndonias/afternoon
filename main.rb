require 'sinatra'
require 'sinatra/activerecord'
require './model'

set :database, "sqlite3:database.sqlite3"

get '/' do
	@x = User.all
	erb :home
end

get '/signup' do
	erb :signup
end

post '/signup' do
	@user = User.new(params[:user])
	if @user.save
		redirect '/'
	else
		redirect '/signup'
	end
end

