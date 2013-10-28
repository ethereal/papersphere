# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(:email => 'chris@test.com', :password => 'test1234', :password_confirmation => 'test1234', :name => 'Chris Horuk')

user1 = User.create(:email => 'hiranya@test.com', :password => 'test1234', :password_confirmation => 'test1234', :name => 'Hiranya')
user2 = User.create(:email => 'alex@test.com', :password => 'test1234', :password_confirmation => 'test1234', :name => 'Alex')
user3 = User.create(:email => 'nevena@test.com', :password => 'test1234', :password_confirmation => 'test1234', :name => 'Nevena')

paper1 = Paper.create(:title => 'Test Paper 1', :author => 'Author 1', :year => 2011, :publication => 'Publication 1', :url => 'http://foo1.com')
paper2 = Paper.create(:title => 'Test Paper 2', :author => 'Author 2', :year => 2012, :publication => 'Publication 2', :url => 'http://foo2.com')
paper3 = Paper.create(:title => 'Test Paper 3', :author => 'Author 3', :year => 2013, :publication => 'Publication 3', :url => 'http://foo3.com')

list = ReadingList.create(:name => 'Distributed Systems')
list.user = user
list.save

list_item1 = ReadingListPaper.create
list_item1.reading_list = list
list_item1.paper = paper1
list_item1.save

list_item2 = ReadingListPaper.create
list_item2.reading_list = list
list_item2.paper = paper2
list_item2.save

list_item3 = ReadingListPaper.create
list_item3.reading_list = list
list_item3.paper = paper3
list_item3.save

group1 = Group.create(:name => 'My Project Team')
group1.owner = user
group1.save

group2 = Group.create(:name => 'People I Hate')
group2.owner = user1
group2.save

member1 = GroupMember.create
member1.group = group1
member1.user = user1
member1.save

member2 = GroupMember.create
member2.group = group1
member2.user = user2
member2.save

member3 = GroupMember.create
member3.group = group1
member3.user = user3
member3.save

member4 = GroupMember.create
member4.group = group2
member4.user = user
member4.save

member5 = GroupMember.create
member5.group = group2
member5.user = user2
member5.save

member6 = GroupMember.create
member6.group = group2
member6.user = user3
member6.save