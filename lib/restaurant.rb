class Restaurant
  
  @@filepath=nil
  
  def self.filepath=(path=nil)
    @@filepath = File.join(APP_ROOT, path)
  end
      
  attr_accessor :name, :cuisine, :price
  
  #Class should know if restaurant file exists
  def self.file_usable?
    if (@@filepath!=nil && File.exists?(@@filepath) && File.readable?(@@filepath) && File.writable?(@@filepath))
      return true
    else
      return false
    end
  end
  
  #Create restaurant file
  def self.create_file
    File.open(@@filepath, 'w')
    return file_usable?()
  end
  
  def self.build
    args = {}
    print "Restaurant name: "
    args[:name]= gets.chomp.strip
    print "Restaurant cuisine: "
    args[:cuisine] = gets.chomp.strip
    print "Restaurant price: "
    args[:price] = gets.chomp.strip
    
    self.new(args)
  end
  
  def self.saved_restaurants()
    restaurants = []
    
    if file_usable?
      File.open(@@filepath, 'r') do |file|
        file.each_line do |line|
          line_array = line.chomp.split("\t")
          
          temp = Restaurant.new
          temp.name = line_array[0]
          temp.cuisine = line_array[1]
          temp.price = line_array[2]
          
          restaurants << temp
        end
      end
    end
    
    return restaurants
  end
  
  def initialize(args={})
    @name = args[:name] ||""
    @cuisine = args[:cuisine] || ""
    @price = args [:price] || ""
  end
  
  #Saves a new restaurant to the textfile
  def save
    if (!Restaurant.file_usable?)
      return false
    end
    
    File.open(@@filepath, 'a') do |file|
      file.puts "#{[@name, @cuisine, @price].join("\t")}\n"
    end
  return true
  end
  
end

