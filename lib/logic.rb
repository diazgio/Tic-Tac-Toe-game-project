class Logic
  def self.turn(arr, player, player_choice)
    valid = false
    until valid
      if arr[player_choice] == 'X' || arr[player_choice] == 'O'
        puts 'Wrong postion, please choose another one'
        return valid
      else
        arr[player_choice] = player.token
        valid = true
        break
      end
    end
    current_play = Board.new(arr)
    current_play.display_board
    current_play.win?
  end

  def self.reset
    options = %w[y n yes no]

    loop do
      puts 'Do you want to play again?: (y/n)'
      player_option = gets.chomp.downcase
      if options.include? player_option
        if player_option == 'yes' || player_option == 'y'
          check = true
          return check
        else
          check = false
        end
      else
        puts 'Sorry, wrong option please enter a valid option.'
      end
      check
    end
  end
end
