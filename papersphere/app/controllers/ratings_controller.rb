class RatingsController < ApplicationController
  
  def create
    @reading_list_paper = ReadingListPaper.find(params[:reading_list_paper_id])
    @rating = Rating.new(params[:rating])
    @rating.reading_list_paper = @reading_list_paper
    @rating.user = current_user
    if @rating.save
      respond_to do |format|
        format.html { redirect_to reading_list_paper_path(@reading_list_paper), :notice => "Your rating has been saved" }
        format.js
      end
    end
  end
  
  def update
    @rating = Rating.find(params[:id])
    @reading_list_paper = ReadingListPaper.find(params[:reading_list_paper_id])
    if @rating.update_attributes(params[:rating])
      respond_to do |format|
        format.html { redirect_to reading_list_paper_path(@reading_list_paper), :notice => "Your rating has been updated" }
        format.js
      end
    end
  end
  
end
