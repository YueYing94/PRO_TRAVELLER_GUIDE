# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
Tour.destroy_all
User.destroy_all

file = URI.open("https://images.unsplash.com/photo-1607770421266-f7a08a856359?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTkxfHx3b21lbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60")
maike = User.new(first_name: "Maike", last_name: "Müller", description: "Hello there! I'm Maike, a passionate graphic designer with a love for creativity and visual storytelling, you can find me exploring art galleries, seeking inspiration from nature, or experimenting with new design techniques.", address: "120 Av. Lucien Salentiny, 9080 Ettelbruck, Luxembourg", email: "maike.mueller@gmail.com", encrypted_password: 2891312, password: 2891312)
maike.image.attach(io: file, filename: "Maike.png", content_type: "image/png")
maike.save!

file = URI.open("https://images.unsplash.com/photo-1526125610303-9041c97e8961?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTI1fHx3b21lbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60")
yue = User.new(first_name: "Yue", last_name: "van de Zand", description: "Larger than life attitude, big on outdoors, nature lover!", address: "Theodora Jacobalaan 49, 3043 PP Rotterdam", email: "yue.vandezand@yahoo.nl", encrypted_password: 1854389, password: 1854389)
yue.image.attach(io: file, filename: "Yue.png", content_type: "image/png")
yue.save!

file = URI.open("https://images.unsplash.com/photo-1548372290-8d01b6c8e78c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjJ8fG1lbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60")
jose = User.new(first_name: "José", last_name: "Alvarez", description: "Adventurous, bold, love people and the sea.", address: "Orellistrasse 21, 8044 Zürich, Switzerland", email: "josé.alvarez@gmail.com", encrypted_password: 8732763, password: 8732763)
jose.image.attach(io: file, filename: "Jose.png", content_type: "image/png")
jose.save!

file = URI.open("https://images.unsplash.com/photo-1501395748724-2ecafca80bfb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTk0fHxibGFjayUyMG1hbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60")
tolu = User.new(first_name: "Tolu", last_name: "Ola", description: "Love a good laugh, love a good meal, love meeting people.", address: "Haverkamp, 25488 Holm, Germany", email: "tolu.ola@lewagon.uk", encrypted_password: 9371231, password: 9371231)
tolu.image.attach(io: file, filename: "Tolu.png", content_type: "image/png")
tolu.save!

file = URI.open("https://images.unsplash.com/photo-1493568000180-ca2fb70ddcba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTMyfHxtb3VudGFpbiUyMGNsaW1iaW5nfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60")
max = User.new(first_name: "Max", last_name: "Mercury", description: "Love a good laugh, love a good meal, love meeting people.", address: "Nordmarksvej 8, 7190 Billund, Denmark ", email: "max.mercury@gmail.com", encrypted_password: 8461634, password: 8461634)
max.image.attach(io: file, filename: "Max.png", content_type: "image/png")
max.save!

file = URI.open("https://images.unsplash.com/photo-1568213816046-0ee1c42bd559?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d2luZSUyMHRhc3Rpbmd8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60")
wine_tasting = Tour.new(name: "Wine-tasting", date: "30/06/2023", time: "16:00", description: "Bring so taste-buds to live with sips of vintages!", capacity: 4, duration: "45 minutes", start_point: "12, Down-by-bay Ave, Luxembourg")
wine_tasting.photos.attach(io: file, filename: "Wine.png", content_type: "image/png")
wine_tasting.user = maike
wine_tasting.save!

file = URI.open("https://images.unsplash.com/photo-1551632811-561732d1e306?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aGlraW5nfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60")
hiking = Tour.new(name: "Hiking", date: "28/06/2023", time: "11:00", description: "Come explore and take in breathtaking views, come be one with nature! Come along with your hiking boots, water bottle and hat.", capacity: 4, duration: "120 minutes", start_point: "Peak District Valley, Rotterdam")
hiking.photos.attach(io: file, filename: "Hiking.png", content_type: "image/png")
hiking.user = yue
hiking.save!

file = URI.open("https://images.unsplash.com/photo-1516633630673-67bbad747022?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHN1cmZpbmd8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60")
surfing = Tour.new(name: "Surfing", date: "28/06/2023", time: "10:00", description: "Massive, big or small waves, ride on!", capacity: 4, duration: "60 minutes", start_point: "Endless shoreline beach, Zürich")
surfing.photos.attach(io: file, filename: "Surfing.png", content_type: "image/png")
surfing.user = jose
surfing.save!

file = URI.open("https://images.unsplash.com/photo-1415125721330-116ba2f81152?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2lnaHRzZWVpbmd8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60")
sight_seeing = Tour.new(name: "Sight-seeing", date: "28/06/2023", time: "13:00", description: "Lets explore my city-centre together, let's visit my city's historic places.", capacity: 5, duration: "120 minutes", start_point: "Starbucks city-centre, Holm")
sight_seeing.photos.attach(io: file, filename: "Sighseeing.png", content_type: "image/png")
sight_seeing.user = tolu
sight_seeing.save!

file = URI.open("https://images.unsplash.com/photo-1502126324834-38f8e02d7160?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bW91bnRhaW4lMjBjbGltYmluZ3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60")
mountain_climbing = Tour.new(name: "Mountain-climbing", date: "01/07/2023", time: "10:00", description: "Are you a sucker for the best views in the world? Get atop a mountain! Come-on, what are you waitng for?", capacity: 5, duration: "120 minutes", start_point: "The Rocky Hillies, right before the snake bend, Denmark")
mountain_climbing.photos.attach(io: file, filename: "Mountainclimb.png", content_type: "image/png")
mountain_climbing.user = max
mountain_climbing.save!
