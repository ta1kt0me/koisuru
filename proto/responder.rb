class Responder
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def response(input)
    ''
  end
end

class WhatResponder < Responder
  def response(input)
    "#{input}って何？"
  end
end

class RandomResponder < Responder
  attr_accessor :responses

  def initialize(name)
    super
    @responses = %w(今日は寒いね チョコ食べたい 昨日10円拾った)
  end

  def response(input)
    @responses[rand @responses.size]
  end
end
