class CharactersController < ApplicationController
  
  def index
    @user = current_user
    @story = Story.find_by(id: params[:story_id])
  end
  
  def new
    @story = Story.find_by(id: params[:story_id])
    @character = Character.new
  end
  
  def create
    @story = Story.find_by(id: params[:story_id])
    render :index
  end
  
  def show
  end
  
  def destroy
  end  
  
  private
  def character_params
    params.require(:character).permit(:name,:gender)
  end  
end
