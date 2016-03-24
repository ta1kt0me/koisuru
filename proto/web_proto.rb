class WebProto
  attr_accessor :proto, :input

  def initialize(input)
    @proto = Unmo.new 'proto'
    @input = input
  end

  def reply
    @proto.name + ': ' + @proto.responder_name + '> ' + @proto.dialogue(input)
  end
end
