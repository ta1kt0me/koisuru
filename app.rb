require 'sinatra'
if development?
  require 'sinatra/reloader'
  require 'byebug'
end

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
end

get '/' do
  'this is sample app1'
end
