require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find do |ele|
      ele.name == name
    end
  end

  def self.find_or_create_by_name(name)
    new_song = self.find_by_name(name)
    new_song ||= self.create_by_name(name)
    new_song
  end

  def self.alphabetical
    self.all.sort{|a, b| a.name <=> b.name }

  end

  def self.new_from_filename(name)
    first_split = name.split(" - ")
    first_split[1].slice!(".mp3")
    # binding.pry
    new_song = self.new_by_name(first_split[1])
    new_song.artist_name = first_split[0]
    new_song
  end

  def self.create_from_filename(name)
    self.new_from_filename(name).save
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
