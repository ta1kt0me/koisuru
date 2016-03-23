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
