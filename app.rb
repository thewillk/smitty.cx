require 'rubygems'
require 'sinatra'

get '/' do
  redirect "/about"
end

get '/about' do
  "SMITTY!!!!!!"
end
