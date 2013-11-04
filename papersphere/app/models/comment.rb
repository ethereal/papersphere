class Comment < ActiveRecord::Base
  belongs_to :reading_list_paper
  belongs_to :author, class_name: "User"
  
  attr_accessible :text
  
  validates_presence_of :text, :author, :reading_list_paper
  
end
