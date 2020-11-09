module Pacman

  ## Function to handle initial user command for placing the pacman within the allowed grid
  def Pacman.placePacman(initialInput)
    attempts = 1
    valid_directions = ['NORTH','SOUTH','EAST','WEST','N','S','E','W']
    ## User has 3 Attempts to enter a valid PLACE command
    while(attempts<=3)

      ## Getting individual members of input array to check for valid user input
      command = initialInput[0].split[0];
      x = initialInput[0].split[1];
      y = initialInput[1];
      facing = initialInput[2];

      if(attempts == 3)
        puts 'You have exceeded your tries. Good Bye!!!!';
        break
        ## CHECKING IF USER INPUT IS VALID
      elsif(command.upcase != "PLACE" || x.to_i.to_s!=x || y.to_i.to_s!=y || !valid_directions.include?(facing.upcase))
        puts 'Invalid Command.... Please try again';
        initialInput = gets.chomp.split(',');
        attempts = attempts + 1
        ## CHECKING IF INITIAL PACMAN POSITION IS WITHIN 5X5 GRID
      elsif(!x.to_i.between?(0,4) || !y.to_i.between?(0,4))
        puts 'Please place your pacman within the grid - Not a valid position for 5x5 grid';    
        initialInput = gets.chomp.split(',');
        attempts = attempts + 1
      else
        Pacman.handleUserAction(x.to_i,y.to_i,facing);
        break
      end
    end
  end

  ## Function to handle different user actions
  def Pacman.handleUserAction(x,y,facing)

    ## Checking that pacman position is within 5x5 grid
    while(x.between?(0,4) && y.between?(0,4))
      puts "Choose from Below options:
      1. MOVE 
      2. LEFT 
      3. RIGHT 
      4. REPORT 
      5. EXIT"
      actionInput = gets.chomp;
      if actionInput.upcase.start_with?('PLACE')
        Pacman.placePacman(actionInput.chomp.split(','))
        break;
      end

      ## Checking for different action input from user like Move,Left,Right,Place
      case actionInput.upcase

        ## Displaying current pacman position for REPORT option
        when "REPORT",'4'
          puts "Current Position: #{x},#{y},#{facing}"

        ## For MOVE option, depending on existing x and y position within the grid, changing/not-changing pacmans position
        when "MOVE",'1'
          case facing.upcase
              when 'NORTH','N'
                  if y != 4
                    y = y + 1
                  end
              when 'SOUTH','S'
                  if y != 0
                    y = y - 1
                  end
              when 'WEST','W'
                  if x != 0
                    x = x - 1
                  end
              when 'EAST','E'
                  if x != 4
                    x = x + 1
                  end
          end
        
        ## For LEFT option, depending on current facing value, changing facing value accordingly
        when "LEFT",'2'
            case facing.upcase
              when 'NORTH','N'
                facing = 'WEST'
              when 'SOUTH','S'
                facing = 'EAST'
              when 'EAST','E'
                facing = 'NORTH'
              when 'WEST','W'
                facing = 'SOUTH'
            end

        ## For RIGHT option, depending on current facing value, changing facing value accordingly
        when "RIGHT",'3'
            case facing
              when 'NORTH','N'
                facing = 'EAST'
              when 'SOUTH','S'
                facing = 'WEST'
              when 'EAST','E'
                facing = 'SOUTH'
              when 'WEST','W'
                facing = 'NORTH'
            end
        
        ## Allowing user to EXIT the app and displaying final position of pacman
        when "EXIT",'5'
          puts "GOOD BYE!! Final Pacman Position: #{x},#{y},#{facing}"
          break;
        end

     end
  end
end

