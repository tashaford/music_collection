require 'pry-byebug'
require_relative 'models/album'
require_relative 'models/artist'

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => 'Natasha'})
artist2 = Artist.new({'name' => 'Colin'})
artist3 = Artist.new({'name' => 'Stuart'})

artist1.save()
artist2.save()
artist3.save()

album1 = Album.new({
  'title'     => 'Blue Balls',
  'genre'     => 'Country',
  'artist_id' => artist2.id
  })
album2 = Album.new({
  'title'     => 'Tennis Table',
  'genre'     => 'dance',
  'artist_id' => artist1.id
})
album3 = Album.new({
  'title'     => 'Codester',
  'genre'     => 'Rap',
  'artist_id' => artist3.id
  })
album4 = Album.new({
  'title'     => 'Bear Balls',
  'genre'     => 'Country',
  'artist_id' => artist2.id
  })

album1.save()
album2.save()
album3.save()
album4.save()


binding.pry
nil