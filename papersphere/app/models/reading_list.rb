class ReadingList < ActiveRecord::Base
  belongs_to :user
  has_many :reading_list_papers, :dependent => :destroy
  has_many :papers, :through => :reading_list_papers
  has_many :reading_list_shares, :dependent => :destroy
  attr_accessible :name

  validates :name, :presence => true
end
