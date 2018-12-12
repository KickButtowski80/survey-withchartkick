# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Task.create(name: "Clean House", complete: true)
Task.create(name: "Wash the disshes", complete: true)
Task.create  name: "Sweep deck", complete: true
Task.create  name: "Chop wood", complete: true
Task.create  name: "Water flowers", complete: false
Task.create  name: "Fix gate", complete: false
