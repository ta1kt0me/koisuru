require 'responder'

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
