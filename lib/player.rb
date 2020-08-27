class Player
  attr_accessor :token, :name
  def initialize(name, token)
    @name = name
    @token = token
  end

  def to_s
    "Player: #{@name}--#{@token}"
  end

  def get_choice(display)
    loop do
      puts "Please enter a number between 1 to 9: "
      choice = gets.chomp.to_i
      index = choice - 1
      if choice.between?(1,9)
        return index
        break
      else
        puts "Wrong position, please choose anthor one"
      end
    end
  end
end
