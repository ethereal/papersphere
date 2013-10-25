class ReadingList < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :papers
  attr_accessible :name
end
