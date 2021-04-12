class Story < ApplicationRecord
  
  validates :title, presence: true
  
  validates :description, presence: true
  
  #validates :user_id, presence: trueこれ不要
  
  belongs_to :user
end
