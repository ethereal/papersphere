class Rating < ActiveRecord::Base
  
  belongs_to :reading_list_paper
  belongs_to :user
  
  attr_accessible :value

end
