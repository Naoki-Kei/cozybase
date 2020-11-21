class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :followings, :followers]

  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end


  def new
    @user = User.new
    @posts = @user.posts.order(id: :desc).page(params[:page])
    counts(@user)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザ登録成功！'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザ登録に失敗しました。'
      render :new
    end
    
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
