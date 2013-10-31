class Comment < ActiveRecord::Base
  belongs_to :reading_list_paper
  
  attr_accessible :text
  
  validates_presence_of :text
  
end
