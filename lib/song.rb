class Song
  attr_accessor :name, :artist_name
  @@all = []

   def initialize(name=nil, artist_name=nil)
     @name=name
     @artist_name=artist_name
   end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
      song=Song.new()
      song.save
      return song
  end

  def self.new_by_name(name)
      song=Song.new(name)
      return song
  end
  

  def self.create_by_name(name)
      song=Song.new(name)
      song.save
      return song
  end

  def self.find_by_name(name)
      Song.all.find {|song| song.name==name}
  end

  def self.find_or_create_by_name(name)
          song=Song.find_by_name(name)
      if song
            return song
      else
          Song.create_by_name(name)
      end
  end

  def self.alphabetical
    Song.all.map.sort_by {|song| song.name}
  end

  def self.new_from_filename(format)
        parsed_string=format.slice(0..-5).split("-")
        artist_name=parsed_string[0].strip
        name=parsed_string[1].strip
        song=Song.new(name, artist_name)
        return song
  end

  def self.create_from_filename(format)
          Song.new_from_filename(format).save
  end

  def self.destroy_all
      @@all=[]
  end

end
