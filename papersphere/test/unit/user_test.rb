require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

  test 'should_create_new_user' do
    charles = User.new :email => 'charles@test.com',
                     :name => 'Charles',
                     :password => 'password',
                     :password_confirmation => 'password'
    assert charles.save
    charles_copy = User.find(charles.id)
    assert_equal charles.email, charles_copy.email
    assert_equal charles.name, charles_copy.name
  end

  test 'should_not_allow_creating_user_with_existing_username' do
    alice = User.new :email => users(:alice).email,
                     :name => users(:alice).name,
                     :password => 'password',
                     :password_confirmation => 'password'
    assert_equal false, alice.save
  end

end
