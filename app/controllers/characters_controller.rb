class CharactersController < ApplicationController
  
  def index
    @user = current_user
    @story = Story.find_by(id: params[:story_id])
  end
  
  def new
  end
  
  def create
  end
  
  def show
  end
  
  def destroy
  end  
end
