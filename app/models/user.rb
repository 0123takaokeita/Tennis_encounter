class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

    # パスワードの正規表現。半角英数字混合。

    # 空では登録できない。
    with_options presence: true do
      validates :nickname
      validates :gender
      validates :age, numericality: true
    end   
end
