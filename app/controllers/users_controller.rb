class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :followings, :followers]

  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(id: :desc).page(params[:page])
    counts(@user)
  end
  
  def edit
    @user = User.find(params[:id])

  end


  def new
    @user = User.new
    
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
  
  def update
    @user = User.find(params[:id])
 
  #編集しようとしてるユーザーがログインユーザーとイコールかをチェック
  if current_user == @user
   
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を編集しました。'
      render :edit
    else
      flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
      render :edit
    end   
   
  else
      redirect_to root_url
  end
   
 
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
  
    def likes
      @user = User.find(params[:id])
      @likeposts = @user.likeposts.page(params[:page])
      counts(@user)
    end
  
  
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:comment)
  end
end
