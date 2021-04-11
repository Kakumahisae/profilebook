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
  
  def destroy
  end  
  
  
  private
  
  def story_params
    params.require(:story).permit(:title,:description)
  end  
  
end
