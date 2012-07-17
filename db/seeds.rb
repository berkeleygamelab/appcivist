# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Creating Users
user1 = User.create(:login =>'Torpedo', :password =>'123', :email =>'abc@abc.com', :location =>'Berkeley, CA')
user2 = User.create(:login => 'matt', :password =>'abc', :email =>'e13mentml@gmail.com', :location =>'Berkeley, CA')
user3 = User.create(:login => 'kleinlieu', :password =>'abc123', :email =>'kleinvinhlieu@gmail.com', :location =>'Berkeley, CA' )

#Creating Questions by using ItemTemplate
q1 = ItemTemplate.create( :producible_type => 'question', :title => 'What can we build at this empty lot?', :location => 'Haste Street, Berkeley, CA', :description => 'There is an empty lot here at the intersection of Haste St. and Telegraph Ave. What can we build here to liven up South Berkeley?') 
q2 = ItemTemplate.create( :producible_type => 'question', :title => 'What can we do to fill these empty stores?', :location => 'Telegraph Ave, Berkeley, CA', :description => 'There are a lot of empty storefronts here. What businesses can we invite here?') 
q3 = ItemTemplate.create( :producible_type => 'question', :title => 'Can we build a street light here?', :location => '2329 Channing Way, Berkeley, CA', :description => 'This part of the street is really dark. Can we get a street light here?') 

#Creating Events by using ItemTemplate
e1 = ItemTemplate.create( :producible_type => 'event', :title => 'Off the Grid Food Trucks', :location => 'Haste Street, Berkeley, CA', :description => 'Street Eateries!') 
e2 = ItemTemplate.create( :producible_type => 'event', :title => 'South Berkeley Business Competition', :location => 'Telegraph Ave, Berkeley, CA', :description => 'This is a case competition to revitalize South Berkeley.') 
e3 = ItemTemplate.create( :producible_type => 'event', :title => 'Take Back the Night', :location => '2329 Channing Way, Berkeley, CA', :description => 'Berkeley stuents are organizing a Take Back the Night march!') 

#Creating Challenges by using ItemTemplate
c1 = ItemTemplate.create( :producible_type => 'challenge', :title => 'Point out all of the landmarks from the 1960s/70s', :location => 'Haste Street, Berkeley, CA', :description => 'Let people know where all the cool things are to see from the 1960s and 70s.') 
c2 = ItemTemplate.create( :producible_type => 'challenge', :title => 'List the top eco-friendly restaurants in South Berkeley', :location => 'Telegraph Ave, Berkeley, CA', :description => 'Please look at title.') 
c3 = ItemTemplate.create( :producible_type => 'challenge', :title => 'What other streets are still too dark to walk on?', :location => '2329 Channing Way, Berkeley, CA', :description => 'Help us find streets that still need to be lit!') 

#Creating Project by using ItemTemplate
#NOTE: not sure what to put in projects...

#Creating Group by using ItemTemplate
g1 = ItemTemplate.create( :producible_type => 'group', :title => 'Berkeley Environmental Group', :location => 'Haste Street, Berkeley, CA', :description => 'Join the Berkeley Evnironmenal Group!') 
g2 = ItemTemplate.create( :producible_type => 'group', :title => 'Berkeley ACLU', :location => 'Telegraph Ave, Berkeley, CA', :description => 'Join our civil rights group!') 
g3 = ItemTemplate.create( :producible_type => 'group', :title => 'Berkeley NOW!', :location => '2329 Channing Way, Berkeley, CA', :description => 'Join Berkeley NOW!') 