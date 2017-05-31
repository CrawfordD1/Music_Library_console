require 'pry-byebug'
require_relative 'models/album'
require_relative 'models/artist'

Artist.delete_all()
Album.delete_all()

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
  'title' => 'Neva Left',
  'genre' => 'Rap'
  })
album2 = Album.new({
  'title' => '2001',
  'genre' => 'Rap'
  })
album3 = Album.new({
  'title' => 'Tension',
  'genre' => 'Hip-Hop'
  })

album1.save()
album2.save()
album3.save()

binding.pry
nil



