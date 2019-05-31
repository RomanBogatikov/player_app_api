# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 100.times do
#   Song.create(
#     title: Faker::Music::Phish.song,
#     artist: Faker::Music.band,
#   )
# end

# Playlist.create([
#   { title: "Roman's playlist" },
#   { title: "Tim's playlist" },
#   { title: "Gometi's playlist"},
#   { title: "Matt's playlist"},
#   { title: "Deva's playlist" },
# ])

# 40.times do
#   Ledger.create([
#     {
#       song_id: rand(1..10),
#       playlist_id: rand(1..2),
#       plays: rand(10..50),
#     }
#   ])
# end

# puts "database seeded with songs and playlists"

# Seed test users

admin = User.new
admin.email = 'admin@bananas.com'
admin.password='123'
admin.password_confirmation='123'
admin.admin = true
admin.save

user = User.new
user.email = 'user@bananas.com'
user.password = '123'
user.password_confirmation = '123'
user.save
