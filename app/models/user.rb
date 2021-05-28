class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

    # belongs_to :gender
    # パスワードの正規表現。半角英数字混合。

    # 空では登録できない。
    with_options presence: true do
      validates :nickname
      validates :gender_id
      validates :age
    end   
end
