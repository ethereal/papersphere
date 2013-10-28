require 'test_helper'
include Devise::TestHelpers

class RemoteLibraryControllerTest < ActionController::TestCase

  setup do
    sign_in User.first
  end

  test 'should get search' do
    xhr :get, :search
    assert_response :success
  end

end
