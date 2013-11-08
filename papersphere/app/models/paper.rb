class Paper < ActiveRecord::Base
  has_many :reading_list_papers, :dependent => :destroy
  has_many :reading_lists, :through => :reading_list_papers
  attr_accessible :author, :publication, :title, :url, :year, :paper_code, :paper_count

  validates :title, :author, :year, :publication, :paper_code, :presence => true
end
