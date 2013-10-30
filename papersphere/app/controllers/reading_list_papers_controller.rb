class ReadingListPapersController < ApplicationController
  # GET /reading_list_papers
  # GET /reading_list_papers.json
  def index
    @reading_list_papers = ReadingListPaper.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reading_list_papers }
    end
  end

  # GET /reading_list_papers/1
  # GET /reading_list_papers/1.json
  def show
    @reading_list_paper = ReadingListPaper.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reading_list_paper }
    end
  end

  # GET /reading_list_papers/new
  # GET /reading_list_papers/new.json
  def new
    @reading_list_paper = ReadingListPaper.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reading_list_paper }
    end
  end

  # GET /reading_list_papers/1/edit
  def edit
    @reading_list_paper = ReadingListPaper.find(params[:id])
  end

  # POST /reading_list_papers
  # POST /reading_list_papers.json
  def create
    paper = Paper.new
    paper.title = params[:paper_title]
    paper.author = params[:paper_authors]
    paper.publication = params[:paper_publication]
    paper.year = params[:paper_year]
    paper.url = params[:paper_url]
    paper.paper_code = params[:paper_code]

    @reading_list_paper = ReadingListPaper.new
    begin
      result = @reading_list_paper.add_paper_to_reading_list(paper, params[:reading_list_id])
      if result == ReadingListPaper::TXN_SUCCESSFUL
        @paper_mgt_notification = "Paper titled '#{paper.title}' was added to the list successfully."
      elsif result == ReadingListPaper::TXN_INVALID_READING_LIST
        @paper_mgt_notification = "Invalid reading list ID: #{params[:reading_list_id]}"
      elsif result == ReadingListPaper::TXN_PAPER_ALREADY_IN_READING_LIST
        @paper_mgt_notification = "Paper '#{paper.title}' already exists in the list."
      else
        @paper_mgt_notification = "Unexpected error while adding paper '#{paper.title}' to the list"
      end
    rescue Exception => ex
      @paper_mgt_notification = "Error while adding paper to reading list: #{ex.message}"
    end

    @reading_list = ReadingList.find(params[:reading_list_id])

    respond_to do |format|
      format.js
    end
  end

  # PUT /reading_list_papers/1
  # PUT /reading_list_papers/1.json
  def update
    @reading_list_paper = ReadingListPaper.find(params[:id])

    respond_to do |format|
      if @reading_list_paper.update_attributes(params[:reading_list_paper])
        format.html { redirect_to @reading_list_paper, notice: 'Reading list paper was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reading_list_paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reading_list_papers/1
  # DELETE /reading_list_papers/1.json
  def destroy
    @reading_list_paper = ReadingListPaper.find(params[:id])
    @reading_list_paper.destroy

    respond_to do |format|
      format.html { redirect_to reading_list_papers_url }
      format.json { head :no_content }
    end
  end
end
