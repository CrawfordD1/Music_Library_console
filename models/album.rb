require 'pg'
require_relative '../db/sql_runner.rb'


class Album

attr_accessor :title, :genre
attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() 
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i()
  end

  def save()
    sql = "INSERT INTO albums(artist_id, title, genre) VALUES (#{@artist_id}, '#{@title}', '#{@genre}') RETURNING * ;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i()
  end

  def update()
    sql = "UPDATE albums SET (artist_id, title, genre) = (#{@artist_id}, '#{@title}', '#{@genre}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
    results = SqlRunner.run(sql)
    artist_data = results[0]
    selected_artist = Artist.new(artist_data)
    return selected_artist
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


  def self.find(input_id)
    sql = "SELECT * FROM albums WHERE id = #{input_id}"
    results = SqlRunner.run(sql)
    album_hash = results.first()
    album = Album.new(album_hash)
    return album
  end


end