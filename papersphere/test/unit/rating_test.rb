require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  
  def test_should_validate_presence_of
    r = Rating.new
    r.value = nil
    r.user = nil
    r.reading_list_paper = nil
    assert_equal false, r.valid?
    
    r.value = 3
    assert_equal false, r.valid?
    
    r.user = users(:alice)
    assert_equal false, r.valid?
    
    r.reading_list_paper = reading_list_papers(:one)
    assert r.valid?
  end
  
  def test_should_validate_inclusion_of_value
    r = ratings(:one)
    assert r.valid?
    
    r.value = 6
    assert_equal false, r.valid?
    assert_equal 1, r.errors.size
    assert_equal "is not included in the list", r.errors.first[1]
  end
  
end
