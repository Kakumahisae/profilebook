module CharactersHelper
  
  def chara_button_text
    if action_name == "new"
      "人物登録"
    elsif action_name == "edit"
      "人物更新"
    end
  end
  
end
