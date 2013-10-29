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

    @reading_list_paper = nil
    begin
      @reading_list = ReadingList.find(params[:reading_list_id])
      @reading_list_paper = ReadingListPaper.new
      if @reading_list_paper.add_paper_to_reading_list(paper, @reading_list)
        @reading_list.reload
        @paper_mgt_notification = "Paper titled '#{paper.title}' was added to the list '#{@reading_list.name}' successfully."
      else
        @paper_mgt_notification = "Paper '#{paper.title}' already exists in the list."
      end
    rescue ActiveRecord::RecordNotFound => ex
      @paper_mgt_notification = "Invalid reading list ID: #{params[:reading_list_id]}"
    rescue Exception => ex
      @paper_mgt_notification = "Error while adding paper to reading list: #{ex.message}"
    end

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
