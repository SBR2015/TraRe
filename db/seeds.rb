# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'csv'

# language setting
languages = CSV.readlines('db/data/languages.csv')
languages.shift #slip 1 row
languages.each do |row|
  lang1 = Language.new
  lang1.code = row[0]
  lang1.save!
end


# resume1 = Resume.new
# resume1.sentence = "こんちはー"
# resume1.owner_id = 1
# resume1.translator_id = 1
# resume1.language_id = 2
# resume1.wanted_language_id = 1
# resume1.save!
