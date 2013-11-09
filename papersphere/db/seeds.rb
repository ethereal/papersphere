# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# user = User.create(:email => 'chris@test.com', :password => 'test1234', :password_confirmation => 'test1234', :name => 'Chris Horuk')
# 
# user1 = User.create(:email => 'hiranya@test.com', :password => 'test1234', :password_confirmation => 'test1234', :name => 'Hiranya Jayathilaka')
# user2 = User.create(:email => 'alex@test.com', :password => 'test1234', :password_confirmation => 'test1234', :name => 'Alex Pucher')
# user3 = User.create(:email => 'nevena@test.com', :password => 'test1234', :password_confirmation => 'test1234', :name => 'Nevena Golubovic')
# 
# paper1 = Paper.create(:title => 'Test Paper 1', :author => 'Author 1',
#                       :year => 2011, :publication => 'Publication 1',
#                       :url => 'http://foo1.com', :paper_code => 'TEST_001')
# paper2 = Paper.create(:title => 'Test Paper 2', :author => 'Author 2',
#                       :year => 2012, :publication => 'Publication 2',
#                       :url => 'http://foo2.com', :paper_code => 'TEST_002')
# paper3 = Paper.create(:title => 'Test Paper 3', :author => 'Author 3',
#                       :year => 2013, :publication => 'Publication 3',
#                       :url => 'http://foo3.com', :paper_code => 'TEST_003')
# 
# list = ReadingList.create(:name => 'Distributed Systems')
# list.user = user
# list.save
# 
# list1 = ReadingList.create(:name => 'MAE Reading List')
# list1.user = user1
# list1.save
# 
# list_item1 = ReadingListPaper.create
# list_item1.reading_list = list
# list_item1.paper = paper1
# list_item1.save
# 
# list_item2 = ReadingListPaper.create
# list_item2.reading_list = list
# list_item2.paper = paper2
# list_item2.save
# 
# list_item3 = ReadingListPaper.create
# list_item3.reading_list = list
# list_item3.paper = paper3
# list_item3.save
# 
# group1 = Group.create(:name => 'My Project Team')
# group1.owner = user
# group1.save
# 
# group2 = Group.create(:name => 'People I Hate')
# group2.owner = user1
# group2.save
# 
# member1 = GroupMember.create
# member1.group = group1
# member1.user = user1
# member1.save
# 
# member2 = GroupMember.create
# member2.group = group1
# member2.user = user2
# member2.save
# 
# member3 = GroupMember.create
# member3.group = group1
# member3.user = user3
# member3.save
# 
# member4 = GroupMember.create
# member4.group = group2
# member4.user = user
# member4.save
# 
# member5 = GroupMember.create
# member5.group = group2
# member5.user = user2
# member5.save
# 
# member6 = GroupMember.create
# member6.group = group2
# member6.user = user3
# member6.save
# 
# share1 = ReadingListShare.create(:access_rights => 'readonly')
# share1.group = group1
# share1.reading_list = list
# share1.save
# 
# share2 = ReadingListShare.create(:access_rights => 'readwrite')
# share2.group = group2
# share2.reading_list = list1
# share2.save

# list1 = ReadingList.create(:name => 'MAE Reading List')
# list1.user = user1
# list1.save
# 
# list.add_paper(paper1)
# list.add_paper(paper2)
# list.add_paper(paper3)
# 
# group1 = Group.create(:name => 'My Project Team')
# group1.owner = user
# group1.save
# 
# group2 = Group.create(:name => 'People I Hate')
# group2.owner = user1
# group2.save
# 
# member1 = GroupMember.create
# member1.group = group1
# member1.user = user1
# member1.save
# 
# member2 = GroupMember.create
# member2.group = group1
# member2.user = user2
# member2.save
# 
# member3 = GroupMember.create
# member3.group = group1
# member3.user = user3
# member3.save
# 
# member4 = GroupMember.create
# member4.group = group2
# member4.user = user
# member4.save
# 
# member5 = GroupMember.create
# member5.group = group2
# member5.user = user2
# member5.save
# 
# member6 = GroupMember.create
# member6.group = group2
# member6.user = user3
# member6.save
# 
# share1 = ReadingListShare.create(:access_rights => 'readonly')
# share1.group = group1
# share1.reading_list = list
# share1.save
# 
# share2 = ReadingListShare.create(:access_rights => 'readwrite')
# share2.group = group2
# share2.reading_list = list1
# share2.save

#########################
# New test data here
#########################
NUM_USERS = 10000
NUM_PAPERS = 10000

MAX_READING_LISTS_PER_USER = 10
MAX_READING_LIST_PAPERS_PER_READING_LIST = 10
MAX_FEEDBACK_PER_READING_LIST_PAPER = 10

MAX_GROUPS_PER_USER = 10
MAX_GROUP_MEMBERS_PER_GROUP = 10

ASSIGNABLE_ACCESS_RIGHTS = ['readwrite', 'readonly']

NUM_PAPERS.times do |i|
  Paper.create(
    title: "Paper #{i}",
    author: "Author #{i}",
    year: "#{i}",
    publication: "Conference #{i}",
    paper_code: "#{i}"
  )
end

NUM_USERS.times do |i|
  user = User.create(
    email: "test#{i}@email.com",
    password: 'test1234',
    password_confirmation: 'test1234',
    name: "Test #{i}"
  )
  user.save!
  
  num_reading_lists = rand(1..MAX_READING_LISTS_PER_USER)
  num_reading_lists.times do |i_rl|
    reading_list = ReadingList.new(:name => "Reading List #{i_rl}")
    reading_list.user = user
    reading_list.save!
    
    num_reading_list_papers = rand(1..MAX_READING_LIST_PAPERS_PER_READING_LIST)
    num_reading_list_papers.times do |i_rlp|
      reading_list.add_paper(Paper.find_by_paper_code("#{rand(0..999)}"))
    end
    
    reading_list.reading_list_papers.each do |rlp|
      num_comments = rand(1..MAX_FEEDBACK_PER_READING_LIST_PAPER)
       num_comments.times do |i_c|
         comment = Comment.new(:text => "Comment ##{i_c}")
         comment.author = User.find_by_email("test#{rand(0..i)}@email.com")
         comment.reading_list_paper = rlp
         comment.save!
       end
       
       num_ratings = rand(1..MAX_FEEDBACK_PER_READING_LIST_PAPER)
       num_ratings.times do |i_r|
         rating = Rating.new(:value => rand(1..5))
         rating.user = User.find_by_email("test#{rand(0..i)}@email.com")
         rating.reading_list_paper = rlp
         rating.save!
       end
    end
   
    # num_reading_list_papers.times do |i_rlp|
    #   reading_list_paper = ReadingListPaper.new
    #   reading_list_paper.reading_list = reading_list
    #   reading_list_paper.paper = 
    #   reading_list_paper.save!
    #   
    #   num_comments = rand(1..MAX_FEEDBACK_PER_READING_LIST_PAPER)
    #   num_comments.times do |i_c|
    #     comment = Comment.new(:text => "Comment ##{i_c}")
    #     comment.author = User.find_by_email("test#{rand(0..i)}@email.com")
    #     comment.reading_list_paper = reading_list_paper
    #     comment.save!
    #   end
    #   
    #   num_ratings = rand(1..MAX_FEEDBACK_PER_READING_LIST_PAPER)
    #   num_ratings.times do |i_r|
    #     rating = Rating.new(:value => rand(1..5))
    #     rating.user = User.find_by_email("test#{rand(0..i)}@email.com")
    #     rating.reading_list_paper = reading_list_paper
    #     rating.save!
    #   end
    #   
    #   reading_list_paper.save!
    # end
    
    reading_list.save!
  end
  
  num_groups = rand(1..MAX_GROUPS_PER_USER)
  num_groups.times do |i_g|
    group = Group.new(:name => "Group #{i_g}")
    group.owner = user
    users_reading_lists = ReadingList.where(:user_id => user.id)
    groups_reading_list_shares = []
    
    num_reading_lists_in_group = rand(1..users_reading_lists.count)
    num_reading_lists_in_group.times do
      rl = users_reading_lists[rand(0..users_reading_lists.count-1)]
      while groups_reading_list_shares.include? rl do
        rl = users_reading_lists[rand(0..users_reading_lists.count-1)]
      end
      
      rls = ReadingListShare.new(:access_rights => ASSIGNABLE_ACCESS_RIGHTS[rand(0..1)])
      rls.reading_list = rl
      rls.group = group
      groups_reading_list_shares << rls
    end
    
    group.reading_list_shares = groups_reading_list_shares
    group.save!
  end
  
  user.save!
end

Group.all.each do |group|
  group.group_members ||= []
  
  num_group_members = rand(1..MAX_GROUP_MEMBERS_PER_GROUP)
  num_group_members.times do
    user = User.find_by_email("test#{rand(0..NUM_USERS-1)}@email.com")
    while group.owner == user || group.group_members.include?(user) do
      user = User.find_by_email("test#{rand(0..NUM_USERS-1)}@email.com")
    end
    group_member = GroupMember.new
    group_member.user = user
    group_member.group = group
    
    group.group_members << group_member
  end
  
  group.save!
end

# USERS 100k
# RLIST 50 per USER
# SHARES 50 per RLIST
# PAPER 100 per RLIST
# COMMENT 100 per PAPER
# same for RATING

