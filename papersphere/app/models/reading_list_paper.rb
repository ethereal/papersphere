class ReadingListPaper < ActiveRecord::Base
  belongs_to :reading_list
  belongs_to :paper
  attr_accessible :paper_id, :reading_list_id
end
