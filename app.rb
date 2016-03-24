class App < Sinatra::Base
  get '/' do
    'this is sample app1'
  end

  get '/answer' do
    WebProto.new('hoge').reply
  end
end
