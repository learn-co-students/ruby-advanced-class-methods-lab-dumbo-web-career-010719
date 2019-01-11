require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    person = Song.new
    @@all << person
    person
  end
  def self.new_by_name(nm)
     person = Song.create
     person.name = nm
     person
  end
  def self.create_by_name(nm)
    person = Song.new_by_name(nm)
    person
  end
  def self.find_by_name(songname)
    @@all.find{ |songObj| songObj.name == songname}
  end
  def self.find_or_create_by_name(songname)
    if self.find_by_name(songname)
      self.find_by_name(songname)
    else
      self.create_by_name(songname)
    end
  end
  def self.destroy_all
    @@all.clear
  end
  def self.new_from_filename(itsname)
    songsArr = itsname.split(/ - |\./)
    newSong = Song.new_by_name(songsArr[1].strip)
    newSong.artist_name = songsArr[0].strip
    newSong
  end
  def self.create_from_filename(itsname)
    self.new_from_filename(itsname)
  end
  def self.alphabetical
    @@all.sort { |ob1, ob2| ob1.name[0] <=> ob2.name[0]}
  end
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end


# song = Song.new_by_name("Blank Space")
# itsname = song.name

#binding.pry
