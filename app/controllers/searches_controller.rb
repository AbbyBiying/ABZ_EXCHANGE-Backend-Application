class SearchesController < ApplicationController
  def show
    @search = Search.new(params[:search])
    @search.perform
  end
end
