class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  if self.find_by_name(name) == nil
    self.create_by_name(name)
  else
      return self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by(&:name)
  end

  def self.new_from_filename(name)
    x = name.split(' - ')
    y = x[1].split('.mp3')
    song = self.new_by_name(y[0])
    song.artist_name = (x[0])
    song
  end

  def self.create_from_filename(name)
    x = name.split(' - ')
    y = x[1].split('.mp3')
    song = self.create_by_name(y[0])
    song.artist_name = (x[0])
  end

  def self.destroy_all
    @@all.clear
  end





end
