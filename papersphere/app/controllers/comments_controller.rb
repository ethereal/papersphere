class CommentsController < ApplicationController

  before_filter :find_reading_list_paper

  def create
    @comment = Comment.new params[:comment]
    @comment.reading_list_paper = @reading_list_paper
    @comment.author = current_user
    
    if @comment.save
      respond_to do |format|
        format.js
      end
      # notify list members  
       Thread.new do
        CommentAddedNotifier.added(@comment).deliver
        ActiveRecord::Base.connection.close
      end
    end
  end
  
  def load_more_comments
    offset = params[:comments_offset].to_f
    @comments_to_display = @reading_list_paper.comments.sort { |c1,c2| c2.created_at <=> c1.created_at }[offset..offset+10]
    respond_to do |format|
      format.json
    end
  end
  
  private
  
  def find_reading_list_paper
    @reading_list_paper = ReadingListPaper.find(params[:reading_list_paper_id])
  end

end
