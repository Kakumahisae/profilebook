class Character < ApplicationRecord
  validates :name, presence: true
  validates :gender, presence: true
  #validates :story_id, presence: true
                     #↓これnulでもよくなるオプション。nulだととおる
  belongs_to :story,optional: true
end
