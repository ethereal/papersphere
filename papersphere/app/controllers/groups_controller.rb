class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.json
  def index
    @groups = current_user.owned_groups
    @group = Group.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    @group_member = GroupMember.new
    @group_member.group = @group

    if params[:from_reading_list]
      @reading_list = ReadingList.find(params[:from_reading_list])
    else
      @reading_list = nil
    end

    respond_to do |format|
      if @group.owner == current_user
        format.html
        format.json { render json: @group }
      else
        msg = "You are not authorized to access group #{params[:id]}."
        format.html { redirect_to groups_url, alert: msg }
        format.json { render json: msg }
      end
    end
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(params[:group])
    @group.owner = current_user
    
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])

    if @group.owner != current_user
      respond_to do |format|
        format.html { redirect_to @group, notice: 'User not authorized.' }
        format.json { render json: @group, status: :not_authorized, location: group }
      end
      return
    end
      
    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
      
    if @group.owner != current_user
      respond_to do |format|
        format.html { redirect_to @group, notice: 'User not authorized.' }
        format.json { render json: @group, status: :not_authorized, location: group }
      end
      return
    end
      
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end
end
