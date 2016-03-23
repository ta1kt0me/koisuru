class Responder
  def initialize(name)
    @name = name
  end

  def response(input)
    ''
  end

  def name
    @name
  end
end

class WhatResponder < Responder
  def response(input)
    "#{input}って何？"
  end
end

class RandomResponder < Responder
  def initialize(name)
    super
    @responses = %w(今日は寒いね チョコ食べたい 昨日10円拾った)
  end

  def response(input)
    @respondses[rand @responses.size]
  end
end
