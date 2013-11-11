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
FACTOR = 100000

NUM_USERS = 1 * FACTOR
NUM_PAPERS = 1 * FACTOR

NUM_READING_LISTS = 5 * FACTOR

NUM_GROUPS = 5 * FACTOR
NUM_READING_LIST_SHARES = 10 * FACTOR

NUM_FEEDBACK = 10 * FACTOR

MAX_READING_LIST_PAPERS_PER_READING_LIST = 10
MAX_GROUP_MEMBERS_PER_GROUP = 10

ASSIGNABLE_ACCESS_RIGHTS = ['readwrite', 'readonly']

papers = []
Paper.transaction do
  NUM_PAPERS.times do |i|
    p = Paper.create(
      title: "Paper #{i}",
      author: "Author #{i}",
      year: "#{i}",
      publication: "Conference #{i}",
      paper_code: "#{i}"
    )
    papers << p
  end
end

users = []
User.transaction do
  NUM_USERS.times do |i|
    user = User.new(
      email: "test#{i}@email.com",
      name: "Test #{i}"
    )
    user.encrypted_password = '$2a$10$neifx2jbggboRNWjYB6S0us6mScL7jhV8cZ8g7I0pizSYr9tsWabq'
    user.save!(:validate => false)
    users << user
  end
end

reading_lists = []
ReadingList.transaction do
  NUM_READING_LISTS.times do |i_rl|
    reading_list = ReadingList.new(:name => "Reading List #{i_rl}", :paper_count => rand(1..MAX_READING_LIST_PAPERS_PER_READING_LIST))
    reading_list.user_id = users.sample.id
    reading_list.save!(:validate => false)
    reading_lists << reading_list
  end
end

def random_subset_of(array, size)
  result = []
  indecies = []
  while result.length < size
    index = rand(0..array.length-1)
    unless indecies.include? index
      indecies << index
      result << array[index]
    end
  end
  result
end

reading_list_papers = []
ReadingListPaper.transaction do 
  reading_lists.each do |rl|
    num_reading_list_papers = rl.paper_count
    papers_to_add = random_subset_of(papers, num_reading_list_papers)
    papers_to_add.each do |p|
      rlp = ReadingListPaper.new
      rlp.paper_id = p.id
      rlp.reading_list_id = rl.id
      rlp.save!(:validate => false)
      reading_list_papers << rlp
    end
  end
end

Comment.transaction do
  NUM_FEEDBACK.times do |i_c|
    comment = Comment.new(:text => "Comment ##{i_c}")
    comment.author_id = users.sample.id
    comment.reading_list_paper_id = reading_list_papers.sample.id
    comment.save!(:validate => false)
  end
end

Rating.transaction do
  NUM_FEEDBACK.times do |i_c|
    rating = Rating.new(:value => rand(1..5))
    rating.user_id = users.sample.id
    rating.reading_list_paper_id = reading_list_papers.sample.id
    rating.save!(:validate => false)
  end
end

groups_hash = {}
groups = []
Group.transaction do
  NUM_GROUPS.times do |i_g|
    group = Group.new(:name => "Group #{i_g}")
    group.owner_id = users.sample.id
    group.save!(:validate => false)
    if groups_hash[group.owner_id].present?
      groups_hash[group.owner_id] << group
    else
      groups_hash[group.owner_id] = [group]
    end
    groups << group
  end
end

GroupMember.transaction do
  groups.each do |g|
    num_group_members = rand(1..MAX_GROUP_MEMBERS_PER_GROUP)
    users_to_add = random_subset_of(users, num_group_members)
    users_to_add.each do |u|
      group_member = GroupMember.new
      group_member.user_id = u.id
      group_member.group_id = g.id
      group_member.save!(:validate => false)
    end
  end
end

ReadingListShare.transaction do
  NUM_READING_LIST_SHARES.times do |i_rls|
    groups_of_user = nil
    reading_list_to_add = nil
    until groups_of_user.present?
      reading_list_to_add = reading_lists.sample
      owner_id = reading_list_to_add.user_id
      groups_of_user = groups_hash[owner_id]
    end
    group_to_share_with = groups_of_user.sample
    rls = ReadingListShare.new(:access_rights => ASSIGNABLE_ACCESS_RIGHTS.sample)
    rls.group_id = group_to_share_with.id
    rls.reading_list_id = reading_list_to_add.id
    rls.save!(:validate => false)
  end
end

# USERS 100k
# RLIST 50 per USER
# SHARES 50 per RLIST
# PAPER 100 per RLIST
# COMMENT 100 per PAPER
# same for RATING

