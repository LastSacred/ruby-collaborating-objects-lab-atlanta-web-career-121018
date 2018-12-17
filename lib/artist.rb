require 'pry'
#require_relative "./song.rb"

class Artist
  attr_reader :songs
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    self.songs << song
  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find do |artist|
      artist.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if !(artist = find_by_name(name))
      (artist = self.new(name)).save
    end
    artist
  end

end
