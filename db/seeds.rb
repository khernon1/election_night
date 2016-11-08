# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Candidate.destroy_all
Candidate.create(name: 'Clinton', total: 0)
Candidate.create(name: 'Trump', total: 0)
Candidate.create(name: 'Seconds Ran', total: 0)