require 'pg'
require_relative '../db/sql_runner.rb'


class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() 
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists(name) VALUES ('#{@name}') RETURNING * ;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i()
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

end