require ('pg')

class Album

  attr_accessor :title, :genre
  attr_reader :id

  def initialize(options)
    @id         = options['id'].to_i if options['id']
    @title      = options['title']
    @genre      = options['genre']
    @artist_id  = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ('#{@title}', '#{@genre}', '#{@artist_id}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = ""
    result = SqlRunner.run(sql)
    return result.map { |album_hash| Album.new(album_hash)}
  end

end