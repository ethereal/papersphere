require 'test_helper'

class ListSharedNotifierTest < ActionMailer::TestCase
  test "shared" do
    mail = ListSharedNotifier.shared
    assert_equal "Shared", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
