require 'responder'

class Unmo
  attr_accessor :name, :responder

  def initialize(name)
    @name = name
    @responder = RandomResponder.new('What')
  end

  def dialogue(input)
    @responder.response(input)
  end

  def responder_name
    @responder.name
  end
end
