class Group < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'
  has_many :group_members, :dependent => :destroy
  attr_accessible :name

  validates :name, :presence => true

  def has_member(email)
    group_members.each { |member|
      if member.user.email == email
        return true
      end
    }
    false
  end

end
