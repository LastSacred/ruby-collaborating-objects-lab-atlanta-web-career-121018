require 'pry'
require_relative "./song.rb"

class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    file_paths = Dir["#{self.path}/*.mp3"]
    file_paths.map do |file_path|
      file_path.split("/").last
    end
  end

  def import
    files.each do |file|
      Song.new_by_filename(file)
    end
  end

end
