class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

    enum gender: {man: 0, women: 1, other: 2}
    # パスワードの正規表現。半角英数字混合。

    # 空では登録できない。
    with_options presence: true do
      validates :nickname
      validates :gender
      validates :age
    end   
end
