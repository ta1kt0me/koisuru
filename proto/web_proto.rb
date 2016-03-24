class WebProto
  extend Forwardable

  attr_accessor :proto, :input

  def_delegators :@proto, :name, :responder_name

  def initialize(input)
    @proto = Unmo.new 'proto'
    @input = input
  end

  def reply
    @proto.dialogue(input)
  end
end
