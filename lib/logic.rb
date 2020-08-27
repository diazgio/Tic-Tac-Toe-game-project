class Logic
  def self.turn(display, player, player_choice)
    valid = false
    while !valid
      if display.board[player_choice] == "X" || display.board[player_choice] == "O"
        puts "Wrong postion, please choose another one"
        return valid
      else
        display.board[player_choice] = player.token
        valid = true
        break
      end
    end
    
    display.display_board
    display.win?
  end

  def self.reset
    options = ['y','n','yes','no']
    
    loop do
      puts "Do you want to play again?: (y/n)"
      player_option = gets.chomp.downcase
      if options.include? player_option
        if player_option == 'yes' || player_option == 'y'
          check = true
          return check
        else
          check = false
          return check
        end
      else
        puts "Sorry, wrong option pleas enter a valid option."
      end
      check
    end
  end

end
