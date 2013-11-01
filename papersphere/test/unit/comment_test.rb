require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  def test_should_validate_presence_of_text_and_author
    c = Comment.new
    c.text = nil
    c.author = nil
    
    assert_equal false, c.valid?
    assert_equal 2, c.errors.size
    
    c.text = "First!"
    assert_equal false, c.valid?
    assert_equal 1, c.errors.size
    
    c.author = users(:alice)
    assert c.valid?
  end
  
end
