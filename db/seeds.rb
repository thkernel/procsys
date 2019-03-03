# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Add initial role in database.
roles = Role.create([{name: "Administrateur"}, {name: "Utilisateur"}])


# Add initial role in database.
services = Service.create([{name: "Administration"}, {name: "Comptabilité"}])


# Add initial users in database.
User.create(full_name: "Admin", gender: "M", position: "Administrateur", service_id: services.first.id, role_id: roles.first.id, email: "salut.amos@gmail.com", password: "AMOSXZIBITDE88",
    password_confirmation: "AMOSXZIBITDE88")


# Capistrano-rails-collection cammands
#cap production rails:rake:log:clear
#cap production rails:rake:tmp:clear
#cap production rails:rake:db:drop
#cap production rails:rake:db:reset
#cap production rails:rake:db:setup
#cap production rails:rake:db:seed
#cap production rails:rake:db:migrate
#cap production rails:rake:db:rollback