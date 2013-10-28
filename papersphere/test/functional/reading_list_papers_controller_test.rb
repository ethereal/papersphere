require 'test_helper'
include Devise::TestHelpers

class ReadingListPapersControllerTest < ActionController::TestCase

  setup do
    @reading_list_paper = reading_list_papers(:one)
    sign_in User.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reading_list_papers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reading_list_paper" do
    assert_difference('ReadingListPaper.count') do
      post :create, {
          :paper_title => 'MyAwesomePaper',
          :paper_authors => 'Authors',
          :paper_year => 2013,
          :paper_publication => 'Publication',
          :paper_url => 'URL',
          :reading_list_id => @reading_list_paper.reading_list_id
      }
    end
    paper = Paper.find_by_title('MyAwesomePaper')
    assert_not_nil paper

    assert_redirected_to reading_list_paper_path(assigns(:reading_list_paper))
  end

  test "should show reading_list_paper" do
    get :show, id: @reading_list_paper
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reading_list_paper
    assert_response :success
  end

  test "should update reading_list_paper" do
    put :update, id: @reading_list_paper, reading_list_paper: { paper_id: @reading_list_paper.paper_id, reading_list_id: @reading_list_paper.reading_list_id }
    assert_redirected_to reading_list_paper_path(assigns(:reading_list_paper))
  end

  test "should destroy reading_list_paper" do
    assert_difference('ReadingListPaper.count', -1) do
      delete :destroy, id: @reading_list_paper
    end

    assert_redirected_to reading_list_papers_path
  end
end
