class WannasController < ApplicationController
  before_action :authenticate_user

  def create
    @wanna = Wanna.new(user_id:@current_user.id, performance_id:params[:performance_id])
    @wanna.save
    redirect_to("/performances/#{params[:performance_id]}")
  end

  def destroy
    @wanna = Wanna.find_by(user_id:@current_user.id, performance_id:params[:performance_id])
    @wanna.destroy
    redirect_to("/performances/#{params[:performance_id]}")
  end
end