require "pry"
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
    me = self.new
    @@all << me
    return me
  end

  def self.new_by_name(name)
    me = self.new
    me.name = name
    return me
  end

  def self.create_by_name(name)
    me = new_by_name(name)
    @@all << me
    return me
  end

  def self.find_by_name(name)
    test = @@all.find do |x|
      x.name == name
    end
  end

  def self.find_or_create_by_name(name)
    test = self.find_by_name(name)
    if test == nil
      create_by_name(name)
    else
      return test
    end
  end
  def self.alphabetical
    @@all.sort_by!{|x| x.name }
  end
  def self.new_from_filename(name)
    datas = name.split(" - ")
    datas2 = datas[1].split(".")
    song = self.new_by_name(datas2[0])
    song.artist_name = datas[0]
    return song
  end

  def self.create_from_filename(name)
    datas = name.split(" - ")
    datas2 = datas[1].split(".")
    song = self.new_by_name(datas2[0])
    song.artist_name = datas[0]
    @@all << song
    return song
  end

  def self.destroy_all
    @@all.clear
  end

end
