class PerformancesController < ApplicationController

  def index
    @performances = Performance.all
  end

  def show
    @performance = Performance.find_by(id: params[:id])
  end

end
