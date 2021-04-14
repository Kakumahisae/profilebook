class Character < ApplicationRecord
  validates :name, presence: true
  validates :gender, presence: true
  validates :story_id, presence: true
  
  
  belongs_to :story
end
