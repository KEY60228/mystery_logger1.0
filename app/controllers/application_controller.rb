class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインしてください"
      redirect_to("/login")
    end
  end

  def forbid_login_user
    if @current_user
      flash[:notice] = "ログイン済みです"
      redirect_to("/users/#{@current_user.id}")
    end
  end

  def forbidden_page
    flash[:notice] = "権限がありません"
    redirect_to("/users/#{@current_user.id}")
  end

  def non_participants
    done_performances = Done.where(performance_id: session[:id])
    done_performances.each do |done_performance|
      if done_performance.user_id != @current_user.id
        flash[:notice] = "感想は公演に参加してからね！"
        redirect_to("/performances/index")
      end        
    end
  end

end
