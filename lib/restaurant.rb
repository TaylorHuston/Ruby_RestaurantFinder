class Restaurant
  
  @@filepath=nil
  
  def self.filepath=(path=nil)
    @@filepath = File.join(APP_ROOT, path)
  end
      
  
  #Class should know if restaurant file exists
  def self.file_usable?()
    if (@@filepath!=nil && File.exists?(@@filepath) && File.readable?(@@filepath) && File.writable?(@@filepath))
      return true
    else
      return false
    end
  end
  
  #Create restaurant file
  def self.create_file()
    File.open(@@filepath, 'w')
    return file_usable?()
  end
  
  
  def self.saved_restaurants()
    
  end
  
end

