class Paper < ActiveRecord::Base
  has_many :reading_list_papers, :dependent => :destroy
  attr_accessible :author, :publication, :title, :url, :year
end
