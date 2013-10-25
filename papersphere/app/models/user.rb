class User < ActiveRecord::Base
  has_many :reading_lists, :dependent => :destroy
  has_many :owned_groups, :class_name => 'Group', :foreign_key => 'owner_id', :dependent => :destroy
  has_and_belongs_to_many :groups

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :provider, :uid, :name
end