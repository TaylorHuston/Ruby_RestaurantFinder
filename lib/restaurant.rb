class Restaurant
  
  @@filepath=nil
  
  def self.filepath=(path=nil)
    @@filepath = File.join(APP_ROOT, path)
  end
      
  
  #Class should know if restaurant file exists
  def self.file_exists?()
    
  end
  
  #Create restaurant file
  def self.create_file()
    
  end
  
  
  def self.saved_restaurants()
    
  end
  
end

