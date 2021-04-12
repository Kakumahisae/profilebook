module StoriesHelper
  
  def button_text
    if action_name == "new"
      "物語登録"
    elsif action_name == "edit"
      "物語更新"
    end
  end
  
end
