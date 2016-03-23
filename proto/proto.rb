class Responder
  def initialize(name)
    @name = name
  end

  def response(input)
    "#{input}って何？"
  end

  def name
    @name
  end
end

class Unmo
  def initialize(name)
    @name = name
    @responder = Responder.new('What')
  end

  def dialogue(input)
    @responder.response(input)
  end

  def responder_name
    @responder.name
  end

  def name
    @name
  end
end

def prompt(unmo)
  unmo.name + ';' + unmo.responder_name + '> '
end

puts 'Unmo System prototype : proto'
proto = Unmo.new('proto')
loop do
  print '> '
  input = gets
  input.chomp!
  break if input == ''

  response = proto.dialogue input
  puts(prompt(proto) + response)
end
