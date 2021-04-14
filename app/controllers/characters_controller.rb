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
    @character = Character.new(character_params)
    if @character.save
      redirect_to story_characters_path, success: '新しく人物を追加しました'
    else
      render :new
    end  
  end
  
  def show
  end
  
  def destroy
  end  
  
  private
  def character_params
    params.require(:character).permit(:name,:gender,:story_id)
  end  
end
