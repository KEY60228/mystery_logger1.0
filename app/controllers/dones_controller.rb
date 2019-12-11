class DonesController < ApplicationController
  before_action :authenticate_user

  def create
    @done = Done.new(user_id:@current_user.id, performance_id:params[:performance_id])
    @done.save
    redirect_to("/performances/#{params[:performance_id]}")
  end

  def destroy
    @done = Done.find_by(user_id:@current_user.id, performance_id:params[:performance_id])
    @done.destroy
    redirect_to("/performances/#{params[:performance_id]}")
  end
end