require 'pry-byebug'
require_relative 'models/album'
require_relative 'models/artist'

Album.delete_all()
Artist.delete_all()


 artist1 = Artist.new({
  'name' => 'Snoop Dogg'
  })
 artist2 =  Artist.new({
  'name' => 'Dr Dre'
  })
 artist3 = Artist.new({
  'name' => 'Die Antwoord'
  })

 artist1.save()
 artist2.save()
 artist3.save()

album1 = Album.new({
  'artist_id' => artist1.id(),
  'title' => 'Neva Left',
  'genre' => 'Rap'
  })
album2 = Album.new({
  'artist_id' => artist2.id(),
  'title' => '2001',
  'genre' => 'Rap'
  })
album3 = Album.new({
  'artist_id' => artist3.id(),
  'title' => 'Tension',
  'genre' => 'Hip-Hop'
  })
album3 = Album.new({
  'artist_id' => artist1.id(),
  'title' => 'Bush',
  'genre' => 'Rap/Disco'
  })

album1.save()
album2.save()
album3.save()

binding.pry
nil



