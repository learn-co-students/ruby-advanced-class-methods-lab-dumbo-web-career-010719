require 'pry'

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
    new_song = self.new
    self.all << new_song
    new_song
  end

  def self.new_by_name(name)
      new_song = self.new
      new_song.name = name
      new_song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    self.all << new_song
    new_song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    found_song = self.find_by_name(name)
    found_song ||= self.create_by_name(name)
    found_song
  end

  def self.alphabetical
    self.all.sort{|song1, song2| song1.name <=> song2.name}
  end

  def self.new_from_filename(file)
    file_str = file.split("-").map{|str| str.strip}
    new_song = self.new_by_name(file_str[1].split(".")[0])
    new_song.artist_name = file_str[0]
    new_song
  end

  def self.create_from_filename(file)
    self.all << self.new_from_filename(file)
  end

  def self.destroy_all
    self.all.clear
  end
end
