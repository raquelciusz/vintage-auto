# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

model_fusca = ["Herbie", "Fusca Conversível", "Super Fuscão", "Fusca Baja", "Fusca Original"]
model_kombi = ["Kombi 1200", "Kombi 1500", "Kombi Clipper", "Kombi Carat", "Kombi"]
color = ["White", "Black", "Red", "Black"]
location = ["Sao Paulo", "Rio de Janeiro", "Curitiba", "Brasilia", "Florianopolis"]

puts 'Cleaning cars'
Car.destroy_all
puts 'Cleaning users'
User.destroy_all

user = User.create!(first_name: 'Teste', last_name: 'dos testes', email: 'teste@teste.com', password: 123456)

puts 'Creating Fusca'
10.times do
  fusca = Car.new(
    brand: 'Volkswagen',
    selection: "Fusca",
    model: model_fusca.sample,
    year: (1990..2010).to_a.sample,
    km: (200..400).to_a.sample,
    color: color.sample,
    price: rand(30.0..100.0),
    location: location.sample,
    description: "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    user:
  )
  fusca.photo_url.attach(io: File.open(Rails.root.join('public/fusca1.jpg')), filename: 'fusca1.jpg', content_type: "image/jpg")
  fusca.photo_url.attach(io: File.open(Rails.root.join('public/fusca2.jpg')), filename: 'fusca2.jpg', content_type: "image/jpg")
  fusca.photo_url.attach(io: File.open(Rails.root.join('public/fusca3.jpg')), filename: 'fusca3.jpg', content_type: "image/jpg")
  fusca.save!
  puts "car #{fusca.id} is created."
end

puts 'Creating Kombi'
10.times do
  kombi = Car.new(
    brand: 'Volkswagen',
    selection: "Kombi",
    model: model_kombi.sample,
    year: (1990..2010).to_a.sample,
    km: (200..400).to_a.sample,
    color: color.sample,
    price: rand(30.0..100.0),
    location: location.sample,
    description: "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    user:
  )
  kombi.photo_url.attach(io: File.open(Rails.root.join('public/kombi1.jpg')), filename: 'fusca1.jpg', content_type: "image/jpg")
  kombi.photo_url.attach(io: File.open(Rails.root.join('public/kombi2.jpg')), filename: 'fusca2.jpg', content_type: "image/jpg")
  kombi.photo_url.attach(io: File.open(Rails.root.join('public/kombi3.jpg')), filename: 'fusca3.jpg', content_type: "image/jpg")
  kombi.save!
  puts "car #{kombi.id} is created."
end

puts 'All Done!'
