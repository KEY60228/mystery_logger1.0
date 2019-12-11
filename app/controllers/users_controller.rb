class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :edit, :update, :show, :logout]}
  before_action :forbid_login_user, {only: [:login_form, :login, :new, :create, ]}
  before_action :ensure_correct_user, {only: [:edit, :update]}

  def index
    @users = User.all
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/performances/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
                      name: params[:name], 
                      email: params[:email],
                      password:params[:password]
                    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "登録完了しました"
      redirect_to("/performances/index")
    else
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
    if @user.save
      flash[:notice] = "編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def done
    @user = User.find_by(id: params[:id])
    @dones = Done.where(user_id: @user.id)
  end

  def wanna
    @user = User.find_by(id: params[:id])
    @wannas = Wanna.where(user_id: @user.id)
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/performances/index")
    end
  end

end
