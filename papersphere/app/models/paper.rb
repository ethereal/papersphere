class Paper < ActiveRecord::Base
  has_and_belongs_to_many :reading_lists
  attr_accessible :author, :publication, :title, :url, :year
end
