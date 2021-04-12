class StoriesController < ApplicationController
  
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
    @story = Story.find_by(id: params[:id])
  end  
  
  def edit
    @story = Story.find_by(id: params[:id])
  end  
  
  def update
    @story = Story.find_by(id: params[:id])
    if @story.update(story_params)
      redirect_to story_path, success: "物語情報を更新しました"
    else
      render :edit
    end  
  end
  
  def destroy
  end  
  
  
  private
  def story_params
    params.require(:story).permit(:title,:description)
  end  
  
end
