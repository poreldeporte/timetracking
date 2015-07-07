# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Project.find_by(name: "Wendys") == nil
	Project.create(name: "Wendys", description: "Top Frostys")
end
if Project.find_by(name: "McDonalds") == nil
	Project.create(name: "McDonalds", description: "Im Loving It")
end 
if Project.find_by(name: "Chicken Kitchen") == nil
	Project.create(name: "Chicken Kitchen", description: "Healthy Fast Food")
end
if Project.find_by(name: "Burger King") == nil
	Project.create(name: "Burger King", description: "McDonalds Wannabee")
end 
if Project.find_by(name: "Chipotle") == nil
	Project.create(name: "Chipotle", description: "Yes Please!!")
end
if Project.find_by(name: "Shake Shack") == nil
	Project.create(name: "Shake Shack")
end 

prj = Project.create(name: "Excused", description: "Dont fail again", estimate: "$3000")
entr = Entry.new(hours: 1, minutes: 32, date: Time.now, comment: "made home page")
entr.project = prj
entr.save

entr = Entry.new(hours: 4, minutes: 12, date: Time.now, comment: "added skeleton for site")
entr.project = prj
entr.save

entr = Entry.new(hours: 0, minutes: 45, date: Time.now, comment: "added 3 excuses")
entr.project = prj
entr.save

entr = Entry.new(hours: 9, minutes: 52, date: Time.now, comment: "finished!")
entr.project = prj
entr.save
