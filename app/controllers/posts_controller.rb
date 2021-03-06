class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  before_action :forbidden_page, {only: [:index]}

  def index
    @posts = Post.all
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
    @performances = Performance.all
  end

  def create
    @post = Post.new(content: params[:content], user_id: @current_user.id, performance_id: params[:performance_id])
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to("/performances/index")
    else
      render("posts/new")
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @performance = Performance.find_by(id: @post.performance_id)
  end

  def edit
    @post = Post.find_by(id: params[:id])
    @performances = Performance.all
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/performances/index")
    else
      render(posts/edit)
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "削除しました"
    redirect_to("/performances/index")
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/performances/index")
    end
  end
end
