# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
user1 = User.create(username: "Michael")
user2 = User.create(username: "Kat")
user3 = User.create(username: "Lucy")

Artwork.destroy_all
art1 = Artwork.create(artist_id: user1.id, title: "Cool Cat", image_url: "https://www.humanesociety.org/sites/default/files/styles/1441x612/public/2018/08/kitten-440379.jpg")
art2 = Artwork.create(artist_id: user2.id, title: "Nice Dog", image_url: "https://i.dailymail.co.uk/1s/2019/11/18/16/21162158-0-image-a-38_1574094224893.jpg")
art3 = Artwork.create(artist_id: user1.id, title: "Cute puppy", image_url: "https://image.cnbcfm.com/api/v1/image/105992231-1561667465295gettyimages-521697453.jpeg")

ArtworkShare.destroy_all
share1 = ArtworkShare.create(artwork_id: art2.id, viewer_id: user1.id)
share2 = ArtworkShare.create(artwork_id: art2.id, viewer_id: user3.id)
share3 = ArtworkShare.create(artwork_id: art3.id, viewer_id: user2.id)
