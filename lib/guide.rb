require_relative 'restaurant'

class Guide
  
  #Locate restaurant text file, or create a new one if needed
  def initialize(path=nil)
    Restaurant.filepath=path
    
    if (Restaurant.file_usable?()== false)
      Restaurant.create_file()
    end
  
  end
  
  def launch()
    introduction()

    result=nil
    
    while (result!=:quit)
      action = get_action()
      result = do_action(action)
    end
 
    conclusion()
  end
  
  def get_action()
    print "> "
    user_response = gets.chomp
    return user_response.downcase.strip
  end
  
  def do_action(action)
    case action
      when 'list'
        puts "Listing..."
      when 'find'
        puts "Finding..."
      when 'quit'
        return :quit
    else
        puts "\nI don't understant that command.\n"
    end
  end
  
  def introduction()
    puts "\n\n<<< welcome to the Food finder >>>\n\nThis is an interactive guid to help you find the food you crave!\n\n"
  end
  
  def conclusion()
    puts "\n<<< Buh-bye! >>>\n\n\n"
  end
  
end
