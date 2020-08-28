class Player
  attr_accessor :name
  attr_reader :token
  def initialize(name, token)
    @name = name
    @token = token
  end
end
