class StoriesController < ApplicationController
  before_action :story_find, only:[:show,:edit,:update,:destroy,:index]
  #################アクセス制限 仮##############
  before_action :logged_in_user, only:[:index, :new, :show, :edit]
 #before_action :ensure_corect_user, only:[:index, :new, :show, :edit]
  
  
  def index
    @user = current_user
    @stories = @user.stories
  end  
  
  def new
    @story = Story.new
  end
  
  def create
    @story = current_user.stories.new(story_params)
    if @story.save
      redirect_to stories_path, success: '物語を登録しました'
    else
      render :new
    end  
  end
  
  def show
  end  
  
  def edit
  end  
  
  def update
    if @story.update(story_params)
      redirect_to story_path, success: "物語情報を更新しました"
    else
      render :edit
    end  
  end
  
  def destroy
    if @story.destroy
      redirect_to stories_path, success: "物語を削除しました"
    else
      render :edit, danger: '削除に失敗しました'
    end  
  end  
  
  private
  def story_params
    params.require(:story).permit(:title,:description)
  end
  
  def story_find
    @story = Story.find_by(id: params[:id])
  end
  
  ######無理
  
  def ensure_corect_user
    # @story.user.idとは別のuser.idを持つ人を弾きたい↓（ログインしてない人もここで一緒に弾けるなら弾きたい。apiconでは？
    if User.where(id:[nil, current_user.id != @story.user.id])
      flash[:warning] = "権限なし"
      redirect_to root_path
    end  
  end
  
end
