class ReadingListSharesController < ApplicationController
  # GET /reading_list_shares
  # GET /reading_list_shares.json
  def index
    @reading_list_shares = ReadingListShare.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reading_list_shares }
    end
  end

  # GET /reading_list_shares/1
  # GET /reading_list_shares/1.json
  def show
    @reading_list_share = ReadingListShare.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reading_list_share }
    end
  end

  # GET /reading_list_shares/new
  # GET /reading_list_shares/new.json
  def new
    @reading_list_share = ReadingListShare.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reading_list_share }
    end
  end

  # GET /reading_list_shares/1/edit
  def edit
    @reading_list_share = ReadingListShare.find(params[:id])
  end

  # POST /reading_list_shares
  # POST /reading_list_shares.json
  def create
    @reading_list_share = ReadingListShare.new(params[:reading_list_share])

    respond_to do |format|
      if @reading_list_share.save
        format.html { redirect_to @reading_list_share, notice: 'Reading list share was successfully created.' }
        format.json { render json: @reading_list_share, status: :created, location: @reading_list_share }
      else
        format.html { render action: "new" }
        format.json { render json: @reading_list_share.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reading_list_shares/1
  # PUT /reading_list_shares/1.json
  def update
    @reading_list_share = ReadingListShare.find(params[:id])

    respond_to do |format|
      if @reading_list_share.update_attributes(params[:reading_list_share])
        format.html { redirect_to @reading_list_share, notice: 'Reading list share was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reading_list_share.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reading_list_shares/1
  # DELETE /reading_list_shares/1.json
  def destroy
    @reading_list_share = ReadingListShare.find(params[:id])
    @reading_list_share.destroy

    respond_to do |format|
      format.html { redirect_to reading_list_shares_url }
      format.json { head :no_content }
    end
  end
end
