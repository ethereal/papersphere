class RatingsController < ApplicationController
  
  before_filter :find_reading_list_paper
  
  def create
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
    
    if @rating.update_attributes(params[:rating])
      respond_to do |format|
        format.html { redirect_to reading_list_paper_path(@reading_list_paper), :notice => "Your rating has been updated" }
        format.js
      end
    end
  end
  
  private
  
  def find_reading_list_paper
    @reading_list_paper = ReadingListPaper.find(params[:reading_list_paper_id])
  end
  
end
