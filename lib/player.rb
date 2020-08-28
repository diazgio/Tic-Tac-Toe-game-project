# rubocop:disable Lint/UnreachableCode

class Player
  attr_accessor :token, :name
  def initialize(name, token)
    @name = name
    @token = token
  end
end

# rubocop:enable Lint/UnreachableCode
