require 'pry'
class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
#binding.pry
  def self.create
    new_song  = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(song)
    self.all.detect {|track| track.name == song}
  end

 # either return a matching song instance with that name or
 # create a new song with the name and return the song instance.
  def self.find_or_create_by_name(new_song)
    find_by_name(new_song) || create_by_name(new_song)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end


#accepts the filename in the name of mp3
# binding.pry
  def self.new_from_filename(file)
    parts = file.split(" - ")
    artist = parts[0]
    song_name = parts[1].gsub(".mp3","")

    song = self.new
    song.name = song_name
    song.artist_name = artist
    song
  end
  def self.create_from_filename(file)
    parts = file.split(" - ")
    artist = parts[0]
    song_name = parts[1].gsub(".mp3","")

    song = self.create
    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
