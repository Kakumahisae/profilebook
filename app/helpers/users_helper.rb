module UsersHelper
  
  def button_text
    if action_name == "new"
      "新規登録"
    elsif action_name == "edit"
      "更新"
    end
  end
  
end
