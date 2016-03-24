class WebProto
  extend Forwardable

  attr_accessor :proto, :input

  def_delegators :@proto, :name, :responder_name

  def initialize(input)
    @proto = Unmo.new 'proto'
    @input = input
  end

  def reply(input)
    @proto.dialogue(input)
  end
end
