class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  #validates :first_name, presence: true
  #validates :last_name, presence: true
  validates :first_name,
   format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/, message: "は全角文字を使用してください"},
   presence: true
 validates :last_name,
   format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/, message: "は全角文字を使用してください"},
   presence: true
  #validates :first_name_kana, presence: true
  #validates :last_name_kana, presence: true
  validates :first_name_kana,
  format: { with: /\A([ァ-ン]|ー)+\z/, message: "は全角（カタカナ）での入力が必須であること。"},
  presence: true
validates :last_name_kana,
  format: { with: /\A([ァ-ン]|ー)+\z/, message: "は全角（カタカナ）での入力が必須であること。"},
  presence: true
  validates :birthday, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "は半角英数を両方含む必要があります"}
  
end
