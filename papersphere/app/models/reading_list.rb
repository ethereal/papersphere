class ReadingList < ActiveRecord::Base
  belongs_to :user
  has_many :reading_list_papers, :dependent => :destroy
  has_many :papers, :through => :reading_list_papers
  has_many :reading_list_shares, :dependent => :destroy
  has_many :groups, :through => :reading_list_shares
  attr_accessible :name

  validates :name, :presence => true
  
  def has_group(my_group)
    groups.each { |group|
      if group == my_group
        return true
      end
    }
    false
  end
end
