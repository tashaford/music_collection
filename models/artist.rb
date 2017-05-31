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

  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    result = SqlRunner.run(sql)
    return result.map { |person| Artist.new(person) }
  end

end