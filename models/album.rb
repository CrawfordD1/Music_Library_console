require 'pg'
require_relative '../db/sql_runner.rb'


class Album

attr_accessor :name, :genre 
attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() 
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i()
  end

  def save()
    sql = "INSERT INTO albums(title, genre) VALUES ('#{@title}', '#{@genre}') RETURNING * ;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    all_albums = SqlRunner.run(sql)
    return all_albums.map {|album| Album.new(album)}
  end



end