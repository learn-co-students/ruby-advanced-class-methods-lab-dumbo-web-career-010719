class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end
  
  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    @@all << new_song
    new_song
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    arr = self.find_by_name(name)
    
    if arr != nil
      return arr
    end
    
    self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by!{|a| a.name}
  end
  
  def self.new_from_filename(filename)
    new_song = self.new
    data  = filename.split('-')
    new_song.name = data[1].chomp(".mp3").strip()
    new_song.artist_name = data[0].strip()
    new_song
    
  end
  
  def self.create_from_filename(filename)
    new_song = self.new
    data  = filename.split('-')
    new_song.name = data[1].chomp(".mp3").strip()
    new_song.artist_name = data[0].strip()
    @@all << new_song
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
