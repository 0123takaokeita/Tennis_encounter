class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :gender

    # パスワードの正規表現。半角英数字混合。
    password_regexp = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d_-]+\z/i.freeze

    # 空では登録できない。
    with_options presence: true do
      validates :nickname, uniqueness:{case_sensitive: false ,message: 'はすでに使用されています。'}
      validates :gender_id, numericality: {other_than: 0, message: 'を選択してください。'}
      validates :age
    end   

    validates :password, format: {with: password_regexp,message: 'は半角英数字を必ずふくめてください。'}
end
