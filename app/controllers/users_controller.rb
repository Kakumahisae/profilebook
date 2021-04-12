class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザー登録に成功しました"
      redirect_to root_path
    else
      render :new
    end  
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to stories_path, success: 'ユーザー情報を更新しました'
    else
      render :edit
    end  
    
  end  
  
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end  
end
