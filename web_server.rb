require 'sinatra'
require 'thin'

get '/' do
  redirect '/index.html'
end