class App < Sinatra::Base
  get '/' do
    'this is sample app1'
  end

  get '/answer' do
    proto = WebProto.new('hoge')
    {
      name: proto.name,
      responder: proto.responder_name,
      answer: proto.reply(params["input"]),
      created_at: Time.now
    }.to_json
  end
end
