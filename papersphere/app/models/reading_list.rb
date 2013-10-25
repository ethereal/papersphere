class ReadingList < ActiveRecord::Base
  belongs_to :user
  has_many :reading_list_papers, :dependent => :destroy
  attr_accessible :name

  validates :name, :presence => true
end
