class CharactersController < ApplicationController
  before_action :set_story, only:[:index, :new, :show, :edit]
  ######アクセス制限######3#
  before_action :logged_in_user, only:[:index, :new, :show, :edit]
  
  def index
    @user = current_user
    @characters = @story.characters
  end
  
  #別解 @character = Character.new(story_id: @story.id)
  def new
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
    @character = Character.find_by(id: params[:id])
  end
  
  def destroy
  end
  
  def edit
    @character = Character.find_by(id: params[:id])
  end
  
  def update
    @character = Character.find_by(id: params[:id])
    if @character.update(character_params)
      redirect_to story_characters_path, success: '人物を更新しました'
    else
      render :edit
    end  
  end  
    
  
  #story_idがなかった
  private
  def character_params
    params.require(:character).permit(:name,:gender,:story_id)
  end
  
  def set_story
    @story = Story.find_by(id: params[:story_id])
  end
  
end
