class App < Sinatra::Base
  get '/' do
    'this is sample app1'
  end

  get '/answer' do
    proto = WebProto.new('hoge')
    {
      question: {
        input: params['input'],
        created_at: unique
      },
      answer: {
        name: proto.name,
        responder: proto.responder_name,
        reply: proto.reply(params['input']),
        created_at: unique
      }
    }.to_json
  end

  private

  def unique
    Time.now.to_i.to_s + Time.now.nsec.to_s
  end
end
