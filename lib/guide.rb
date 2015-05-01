require_relative 'restaurant'

class Guide
  class Config
    @@actions = ['list', 'find', 'add', 'quit']
    def self.actions
      return @@actions
    end
  end
  
  
  #Locate restaurant text file, or create a new one if needed
  def initialize(path=nil)
    Restaurant.filepath=path
    
    if (!Restaurant.file_usable?())
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
  
  #Loop until we get a proper user action
  def get_action()
    action=nil
    while (!Guide::Config.actions.include?(action))
      puts "Actions: " + Guide::Config.actions.join(", ")
      print "> "
      user_response = gets.chomp
      action =  user_response.downcase.strip
    end
    return action
  end
  
  #Process based on action provided by user
  def do_action(action)
    case action
      when 'list'
        list
      when 'find'
        puts "Finding..."
      when 'add'
       add
      when 'quit'
        return :quit
      else
      puts "\nI don't understand that command.\n"
    end
  end
  
  def list
    puts "\nListing restaurants\n\n".upcase
    restaurants = Restaurant.saved_restaurants
    
    restaurants.each do |rest|
      puts rest.name + " | " + rest.cuisine + " | " + rest.price
    end
    
  end
  
  def add
    puts "\nAdd a restaurant\n\n".upcase
    
    restaurant = Restaurant.build
    
    if (restaurant.save)
      puts "\nRestaurant Saved\n\n"
    else
      puts "\nError: restaurant not saved\n\n"
    end
  end
  
  def introduction
    puts "\n\n<<< welcome to the Food finder >>>\n\nThis is an interactive guid to help you find the food you crave!\n\n"
  end
  
  def conclusion
    puts "\n<<< Buh-bye! >>>\n\n\n"
  end
  
end
