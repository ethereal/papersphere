class User < ActiveRecord::Base
  has_many :reading_lists, :dependent => :destroy
  has_many :owned_groups, :class_name => 'Group', :foreign_key => 'owner_id', :dependent => :destroy
  has_many :group_members, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :provider, :uid, :name
                  
  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    user = User.create(name: data["name"],
  		                email: data["email"],
  		                password: Devise.friendly_token[0,20]
  		                ) unless user

    user
  end
  
end