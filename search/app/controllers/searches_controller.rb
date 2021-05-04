class SearchesController < ApplicationController

  # GET    /searches
  def index
    User.reindex
    search = params[:term].present? ? params[:term] : nil
    @users = search.present? ? User.search(search) : []
  end
end
