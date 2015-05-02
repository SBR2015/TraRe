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

# seedでUserに紐付かないResumeをInsertするとエラーになるのでコメントアウトしておく。
#
#resumes = CSV.readlines('db/data/resumes.csv')
#resumes.each do |row|
#  resume = Resume.new
#  resume.id = row[0]
#  resume.sentence = row[1]
#  resume.is_translation = row[2]
#  resume.owner_id = row[3]
#  resume.translator_id = row[4]
#  resume.language_id = row[5]
#  resume.save!
#end

# resume1 = Resume.new
# resume1.sentence = "こんちはー"
# resume1.owner_id = 1
# resume1.translator_id = 1
# resume1.language_id = 2
# resume1.save!
