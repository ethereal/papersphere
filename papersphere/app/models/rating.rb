class Rating < ActiveRecord::Base
  
  belongs_to :reading_list_paper
  belongs_to :user
  
  attr_accessible :value
  
  validates_presence_of :value, :user, :reading_list_paper
  
  validates_inclusion_of :value, in: [1, 2, 3, 4, 5]

end
