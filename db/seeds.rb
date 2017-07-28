# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

#Read de csv
csv_text = File.read(Rails.root.join('lib', 'seeds', 'fights.csv'))
#Ecnode the csv
csv = CSV.parse(csv_text, headers: true, encoding: 'iso-8859-1:utf-8')
csv.each do |row|
  fight = Fight.new
  fight.level_id = row['level']
  fight.stamina = row['stamina']
  fight.boss = row['boss']
  fight.stages = row['stages']
  fight.save
  puts "#{fight.boss}, #{fight.stamina}, #{fight.stages} saved"
end