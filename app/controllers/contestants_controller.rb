class ContestantsController < ApplicationController 
  def index 
    @bachelorette = Bachelorette.find(params[:bachelorette_id])
  end
end