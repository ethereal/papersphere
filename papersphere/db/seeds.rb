# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(:email => 'chris@test.com', :password => 'test1234', :password_confirmation => 'test1234', :name => 'Chris')

user1 = User.create(:email => 'hiranya@test.com', :password => 'test1234', :password_confirmation => 'test1234', :name => 'Hiranya')
user2 = User.create(:email => 'alex@test.com', :password => 'test1234', :password_confirmation => 'test1234', :name => 'Alex')
user3 = User.create(:email => 'nevena@test.com', :password => 'test1234', :password_confirmation => 'test1234', :name => 'Nevena')

paper1 = Paper.create(:title => 'Test Paper 1', :author => 'Author 1', :year => 2011, :publication => 'Publication 1', :url => 'http://foo1.com')
paper2 = Paper.create(:title => 'Test Paper 2', :author => 'Author 2', :year => 2012, :publication => 'Publication 2', :url => 'http://foo2.com')
paper3 = Paper.create(:title => 'Test Paper 3', :author => 'Author 3', :year => 2013, :publication => 'Publication 3', :url => 'http://foo3.com')

list = ReadingList.create(:name => 'Distributed Systems')
paper1.reading_lists = [list]
paper2.reading_lists = [list]
paper3.reading_lists = [list]
list.user = user
list.save!
paper1.save!
paper2.save!
paper3.save!

group1 = Group.create(:name => 'My Project Team')
group1.users = [user1, user2, user3]
group1.owner = user
group1.save!

group2 = Group.create(:name => 'People I Hate')
group2.users = [user, user2, user3]
group2.owner = user1
group2.save!
