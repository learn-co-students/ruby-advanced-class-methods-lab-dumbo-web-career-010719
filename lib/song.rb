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
    self.all.find {|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    file_arr = file.split(" - ")
    artist = file_arr[0]
    title = file_arr[1].gsub(".mp3", "")
    song = Song.new
    song.name = title
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end



















































# class Song
#
#   attr_accessor :name, :artist_name
#
#   @@all = []
#
#   def self.all
#     @@all
#   end
#
#   def save
#     self.class.all << self
#   end
#
#   def self.create
#     new_song = Song.new
#     new_song.save
#     new_song
#   end
#
#   def self.new_by_name(song_name)
#     song = self.new
#     song.name = song_name
#     song
#   end
#
#   def self.create_by_name(song_name)
#     song = Song.create
#     song.name = song_name
#     song
#   end
#
#   def self.find_by_name(song_name)
#     self.all.find {|song| song.name == song_name}
#   end
#
#   def self.find_or_create_by_name(new_name)
#     self.find_by_name(new_name) || self.create_by_name(new_name)
#   end
#
#   def self.alphabetical
#     self.all.sort_by {|title| title.name}
#   end
#
#   def self.new_from_filename(file)
#     title_arr = file.split(" - ")
#     artist = title_arr[0]
#     title = title_arr[1].gsub(".mp3", "")
#
#     song = self.new
#     song.name = title
#     song.artist_name = artist
#     song
#   end
#
#   def self.create_from_filename(filename)
#     song = self.new_from_filename(filename)
#     @@all << song
#   end
#
#   def self.destroy_all
#     self.all.clear
#   end
#
# end
