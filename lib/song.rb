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
    song.save
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.new_by_name(title)
    song.save
    song
  end

  def self.find_by_name(string)
    self.all.find do |title|
      title.name == string
    end
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title)
      self.find_by_name(title)
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    self.all.sort_by(&:name)
  end

  def self.create_with_name(file)
    container, name = [], ""
    song = self.create_by_name(file)
    container = song.name.split(" - ")
    name = container[1].split(".")
    song.name = name[0]
    song.artist_name = container[0]
    song
  end

  def self.new_from_filename(file)
    self.create_with_name(file)
  end

  def self.create_from_filename(file)
    self.create_with_name(file)
  end

  def self.destroy_all
    @@all = []
  end
end
