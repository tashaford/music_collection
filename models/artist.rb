require ('pg')
require_relative ('../db/sql_runner')

class Artist

  attr_reader :id, :name

  def initialize(options)
    @id     = options['id'].to_i
    @name   = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING * ;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{id};"
    results = SqlRunner.run(sql)
    albums = results.map { |album| Album.new(album)}
    return albums
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE artists SET (name) = ('#{@name}';"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    result = SqlRunner.run(sql)
    return result.map { |person| Artist.new(person) }
  end

  def self.find()
    sql = "SELECT * FROM artists WHERE id = #{@id};"
    result = SqlRunner.run(sql)
    artist_hash = result.first()
    artist = Artist.new(artist_hash)
    return artist
  end

end