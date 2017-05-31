require 'pg'
require_relative '../db/sql_runner.rb'


class Artist

  attr_accessor :name
  attr_reader :id


  def initialize(options)
    @id = options['id'].to_i()
    @name = options['name']
  end

  def update()
    sql = "UPDATE artists SET (name) = ('#{@name}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO artists(name) VALUES ('#{@name}') RETURNING * ;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i()
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
    all_albums = SqlRunner.run(sql)
    return all_albums.map {|new_album| Album.new(new_album)}
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    all_artists = SqlRunner.run(sql)
    return all_artists.map {|artist| Artist.new(artist)}
  end

  def self.find(input_id)
    sql = "SELECT * FROM artists WHERE id = #{input_id}"
    results = SqlRunner.run(sql)
    artist_hash = results.first()
    artist = Artist.new(artist_hash)
    return artist
  end


end