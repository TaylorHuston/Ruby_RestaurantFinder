class Guide
  
  #Locate restaurant text file, or create a new one if needed
  def initialize(path=nil)
    
  end
  
  def launch()
    introduction()
    
    conclusion()
  end
  
  def introduction()
    puts "\n\n<<< welcome to the Food finder >>>\n\nThis is an interactive guid to help you find the food you crave!\n\n"
  end
  
  def conclusion()
    puts "\n<<< Buh-bye! >>>\n\n\n"
  end
  
end
