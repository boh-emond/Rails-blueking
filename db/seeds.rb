# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Booking.destroy_all
Room.destroy_all
Hotel.destroy_all

# Generate 5 hotels, each with 2 rooms
bristol = Hotel.create(
  name: "Hotel Bristol, mais pas le palace",
  address: "16 villa Gaudelet, Paris, 75011"
)

montparnasse = Hotel.create(
  name: "Montparnasse",
  address: "10 boulevard Montparnasse, 75015, Paris"
)

entre_amis = Hotel.create(
  name: "Entre-Amis",
  address: "20 rue du Général Beurret, 75015, Paris"
)

Room.create(
  name: "La chambre jaune",
  capacity: rand(1..5),
  price_per_night: rand(50..300).round(2),
  hotel: bristol
)

Room.create(
  name: "La chambre verte",
  capacity: rand(1..5),
  price_per_night: rand(50..300).round(2),
  hotel: bristol
)

Room.create(
  name: "La chambre pas complètement mauve, mais un peu violette quand même",
  capacity: rand(1..5),
  price_per_night: rand(50..300).round(2),
  hotel: bristol
)

Room.create(
  name: "Montpar Ici",
  capacity: rand(1..5),
  price_per_night: rand(50..300).round(2),
  hotel: montparnasse
)

Room.create(
  name: "Montpar Là",
  capacity: rand(1..5),
  price_per_night: rand(50..300).round(2),
  hotel: montparnasse
)

Room.create(
  name: "Non pas ce soir",
  capacity: rand(1..5),
  price_per_night: rand(50..300).round(2),
  hotel: montparnasse
)

Room.create(
  name: "Juste copains - La Friendzone",
  capacity: rand(1..5),
  price_per_night: rand(50..300).round(2),
  hotel: entre_amis
)

Room.create(
  name: "Co-pain pour du beurre",
  capacity: rand(1..5),
  price_per_night: rand(50..300).round(2),
  hotel: entre_amis
)

Room.create(
  name: "Copains mais pas que pour du pain",
  capacity: rand(1..5),
  price_per_night: rand(50..300).round(2),
  hotel: entre_amis
)

p "created hotels number - #{Hotel.all.count} / user number #{User.all.count} / room number #{Room.all.count} "
