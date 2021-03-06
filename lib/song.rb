require 'pry'
require_relative "./artist.rb"

class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    split_file_name = file_name.split(" - ")
    song_name = split_file_name[1]
    artist_name = split_file_name[0]
    song = self.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.artist.add_song(song)
    song
  end

end
