class Genre

  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize (name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self if !song.genre
    @songs << song if !@songs.include? (song)
  end

  def artists
    array = @songs.collect {|song| song.artist}
    array.uniq
  end

end