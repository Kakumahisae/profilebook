class User < ApplicationRecord
  
  validates :name, presence: true, 
                   length: {maximum: 8 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX }
                      
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, presence: true,
                       length: {minimum: 8 },
                       format: { with: VALID_PASSWORD_REGEX }
                         
  has_secure_password                    
  
  
  has_many :stories
end
