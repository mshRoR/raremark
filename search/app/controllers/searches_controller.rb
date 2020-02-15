class SearchesController < ApplicationController

  # GET    /searches
  def index
    User.reindex
    search = params[:term].present? ? params[:term] : nil
    @users =
        if search
          User.search search
        else
          []
        end
  end
end
