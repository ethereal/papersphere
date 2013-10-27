class RemoteLibraryController < ApplicationController
  def search
    if params[:page]
      page = params[:page].to_i
    else
      page = 1
    end

    if params[:db] == 'ieee'
      helper = RemoteLibraryHelper::IEEEHelper.new
    else
      helper = RemoteLibraryHelper::ACMHelper.new
    end

    @results = helper.search(params[:query], page)
    respond_to do |format|
      format.js
    end
  end
end
