# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
Bookmark.destroy_all
Booking.destroy_all
Message.destroy_all
Chatroom.destroy_all
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


file1 = URI.open("https://images.unsplash.com/photo-1568213816046-0ee1c42bd559?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d2luZSUyMHRhc3Rpbmd8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60")
file2 = URI.open("https://images.unsplash.com/photo-1575032748932-70116d68ed58?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80")
file3 = URI.open("https://images.unsplash.com/photo-1469533802599-76ee5be68f7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80")
wine_tasting = Tour.new(name: "Wine-tasting", date: "30/06/2023", time: "16:00", description: "Bring your taste-buds to life with sips of vintages!", capacity: 4, duration: "45 minutes", start_point: "120 Av. Lucien Salentiny, 9080 Ettelbruck, Luxembourg")
wine_tasting.photos.attach([io: file1, filename: "Wine1.png", content_type: "image/png"], [io: file2, filename: "Wine2.png", content_type: "image/png"], [io: file3, filename: "Wine3.png", content_type: "image/png"])

wine_tasting.user = maike
wine_tasting.save!


file1 = URI.open("https://images.unsplash.com/photo-1551632811-561732d1e306?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aGlraW5nfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60")
file2 = URI.open("https://images.unsplash.com/photo-1642933196736-1138b99bd5da?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80")
file3 = URI.open("https://images.unsplash.com/photo-1440186347098-386b7459ad6b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80")
hiking = Tour.new(name: "Hiking", date: "28/06/2023", time: "11:00", description: "Come explore and take in breathtaking views, come be one with nature! Come along with your hiking boots, water bottle and hat.", capacity: 4, duration: "120 minutes", start_point: "226, Delftweg, Overschie, Rotterdam")
hiking.photos.attach([io: file1, filename: "Hiking1.png", content_type: "image/png"], [io: file2, filename: "Hiking2.png", content_type: "image/png"], [io: file3, filename: "Hiking3.png", content_type: "image/png"])

hiking.user = yue
hiking.save!

file1 = URI.open("https://images.unsplash.com/photo-1516633630673-67bbad747022?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHN1cmZpbmd8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60")
file2 = URI.open("https://images.unsplash.com/photo-1493225255756-d9584f8606e9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c3VyZmluZ3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60")
file3 = URI.open("https://images.unsplash.com/photo-1517699418036-fb5d179fef0c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1034&q=80")
surfing = Tour.new(name: "Surfing", date: "28/06/2023", time: "10:00", description: "Massive, big or small waves, ride on!", capacity: 4, duration: "60 minutes", start_point: "Bellariarain 8038 Zürich")
surfing.photos.attach([io: file1, filename: "Surfing1.png", content_type: "image/png"], [io: file2, filename: "Surfing2.png", content_type: "image/png"], [io: file3, filename: "Surfing3.png", content_type: "image/png"])

surfing.user = jose
surfing.save!

file1 = URI.open("https://images.unsplash.com/photo-1415125721330-116ba2f81152?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2lnaHRzZWVpbmd8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60")
file2 = URI.open("https://images.unsplash.com/photo-1566577350641-aeb616b7f477?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80")
file3 = URI.open("https://images.unsplash.com/photo-1577366773073-a57cdf7132cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGJ1ZGFwZXN0fGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60")
sight_seeing = Tour.new(name: "Sight-seeing", date: "28/06/2023", time: "13:00", description: "Lets explore my city-centre together, let's visit my city's historic places.", capacity: 5, duration: "120 minutes", start_point: "Hauptstr. 14, 25488 Holm, Schleswig-Holstein Germany")
sight_seeing.photos.attach([io: file1, filename: "Sightseeing1.png", content_type: "image/png"], [io: file2, filename: "Sightseeing2.png", content_type: "image/png"], [io: file3, filename: "Sightseeing3.png", content_type: "image/png"])

sight_seeing.user = tolu
sight_seeing.save!

file1 = URI.open("https://images.unsplash.com/photo-1502126324834-38f8e02d7160?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bW91bnRhaW4lMjBjbGltYmluZ3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60")
file2 = URI.open("https://images.unsplash.com/photo-1519904981063-b0cf448d479e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80")
file3 = URI.open("https://images.unsplash.com/photo-1469474968028-56623f02e42e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzV8fG1vdW50YWlufGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60")
mountain_climbing = Tour.new(name: "Mountain-climbing", date: "01/07/2023", time: "10:00", description: "Are you a sucker for the best views in the world? Get atop a mountain! Come-on, what are you waitng for?", capacity: 5, duration: "120 minutes", start_point: "Nordmarksvej 8, 7190 Billund, Denmark")
mountain_climbing.photos.attach([io: file1, filename: "Mountainclimb1.png", content_type: "image/png"], [io: file2, filename: "Mountainclimb2.png", content_type: "image/png"], [io: file3, filename: "Mountainclimb3.png", content_type: "image/png"])

mountain_climbing.user = max
mountain_climbing.save!
