# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

type = ["Fusca", "Kombi"]
model = ["Herbie", "Fusca Conversível", "Super Fuscão", "Fusca Baja", "Fusca Original"]
color = ["White", "Black", "Red", "Black"]
location = ["Sao Paulo", "Rio de Janeiro", "Curitiba", "Brasilia", "Florianopolis"]

puts 'Cleaning cars'
Car.destroy_all
puts 'Cleaning users'
User.destroy_all

user = User.create!(email: 'teste@teste.com', password: 123456)

puts 'Creating cars'
20.times do
  car = Car.create!(
    brand: 'Volkswagen',
    selection: type.sample,
    model: model.sample,
    year: (1990..2010).to_a.sample,
    km: (200..400).to_a.sample,
    color: color.sample,
    price: (30000..100000).to_a.sample,
    location: location.sample,
    description: "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    user:
  );
  puts "car #{car.id} is created."
end

puts 'All Done!'
