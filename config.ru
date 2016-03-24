require 'sinatra'
require 'byebug' if development?

require './proto/web_proto'
require './proto/responder'
require './proto/unmo'

require './app'

run App
