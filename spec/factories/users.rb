FactoryBot.define do
  factory :user do
    # password確認のための変数
    word = 'aA1' + Faker::Internet.password
    
    nickname              {Gimei.unique.name}
    age                   {Faker::Date.between(from: '1950/1/1', to: Date.today.ago(16.years))}      
    gender                {['男性','女性'][rand(2)]}
    email                 {Faker::Internet.email}
    password              {word}
    password_confirmation {word}



  end
end
