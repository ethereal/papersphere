class CommentsController < ApplicationController

  def create
    @reading_list_paper = ReadingListPaper.find(params[:reading_list_paper_id])
    @comment = Comment.new params[:comment]
    @comment.reading_list_paper = @reading_list_paper
    @comment.author = current_user
    
    if @comment.save
      respond_to do |format|
        format.js
      end
    end
  end

end
