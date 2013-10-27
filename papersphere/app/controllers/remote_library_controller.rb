class RemoteLibraryController < ApplicationController
  def search
    helper = RemoteLibraryHelper::ACMHelper.new
    @results = helper.search(params[:query])
    respond_to do |format|
      format.js
    end
  end
end
