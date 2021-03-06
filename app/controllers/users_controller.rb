class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  def index
    @users = User.order(id: :desc).page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    
    @posts = @user.posts.order(id: :desc).page(params[:page])
    counts(@user)
    
    @posts.each do |post|
      @comments = post.comments
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  
  def favorites
    @user = User.find(params[:id])
    @favorites = @user.favorite_posts.page(params[:page])
    counts(@user)
  end
   private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
