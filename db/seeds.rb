# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

names = %w"bobby peggy bau jasmine rocco sofia lulu maria soldatino pokemon dartagnan comevava"
breeds = %w"segugio pitbull alano terranova mastino bastardino"
provenance = %w"Ostiense Parioli Magliana Nomentano Trullo Prati Esquilino"
gender = %w"M F"

30.times do
  Dog.create(
    name: names.sample,
    breed: breeds.sample,
    provenance: provenance.sample,
    gender: gender.sample)
end