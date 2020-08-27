# rubocop:disable Lint/UnreachableCode

class Player
  attr_accessor :token, :name
  def initialize(name, token)
    @name = name
    @token = token
  end

  def to_s
    "Player: #{@name}--#{@token}"
  end

  def get_choice(arg)
    loop do
      puts 'Please enter a number between 1 to 9: '
      choice = gets.chomp.to_i
      index = choice - 1
      if arg.include? choice
        return index
        break
      else
        puts 'Wrong position, please choose another one'
      end
    end
  end
end

# rubocop:enable Lint/UnreachableCode
