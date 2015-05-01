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
  
  def launch
    introduction

    result=nil
    
    while (result!=:quit)
      action, args = get_action
      result = do_action(action, args)
    end
 
    conclusion
  end
  
  #Loop until we get a proper user action
  def get_action
    action=nil
    while (!Guide::Config.actions.include?(action))
      puts "\nActions: " + Guide::Config.actions.join(", ")
      print "> "
      user_response = gets.chomp
      args =  user_response.downcase.strip.split(' ')
      action = args.shift
    end
    return [action, args]
  end
  
  #Process based on action provided by user
  def do_action(action, args=[])
    case action
      when 'list'
        list
      when 'find'
        keyword = args.shift
        find(keyword)
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
  
  def find(keyword=nil)
    if(keyword)
      restaurants = Restaurant.saved_restaurants
      keyword.downcase!
      
      found = restaurants.select do |rest|
        rest.name.downcase.include?(keyword) ||
        rest.cuisine.downcase.include?(keyword)
      end
      
      found.each do |rest|
        puts rest.name + " | " + rest.cuisine + " | " + rest.price
      end
    else
      puts "Find using a key phrase.\nExample: Find Mexican."
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
