class RemoteLibraryController < ApplicationController
  def search
    helper = RemoteLibraryHelper::ACMHelper.new
    if params[:page]
      page = params[:page].to_i
    else
      page = 1
    end

    @results = helper.search(params[:query], page)
    respond_to do |format|
      format.js
    end
  end
end
