require 'test_helper'

class PaperAddedNotifierTest < ActionMailer::TestCase
  test "added" do
  	reading_list = reading_lists(:one)
    mail = PaperAddedNotifier.added('alice', 'title', reading_list)
   	assert_equal "Paper has been added to your reading list.", mail.subject
    assert_equal ["papersphere2013@gmail.com"], mail.from
  end

end
