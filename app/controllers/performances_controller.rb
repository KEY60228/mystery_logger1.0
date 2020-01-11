class PerformancesController < ApplicationController
  before_action :non_participants, {only: [:show]}

  def index
    @performances = Performance.all
  end

  def show
    @performance = Performance.find_by(id: params[:id])
  end

end
