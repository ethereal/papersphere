require 'test_helper'

class PaperAddedNotifierTest < ActionMailer::TestCase
  test "added" do
    mail = PaperAddedNotifier.added
    assert_equal "Added", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
