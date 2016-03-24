class Unmo
  attr_accessor :name, :responder, :resp_what, :resp_random

  def initialize(name)
    @name = name
    @resp_what = WhatResponder.new('What')
    @resp_random = RandomResponder.new('Random')
    @responder = @resp_random
  end

  def dialogue(input)
    @responder = rand(2) == 0 ? @resp_what : @resp_random
    @responder.response(input)
  end

  def responder_name
    @responder.name
  end
end
