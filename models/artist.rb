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

  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artist;"
    result = SqlRunner.run(sql)
    return result.map { |person| Artist.new(person) }
  end

end