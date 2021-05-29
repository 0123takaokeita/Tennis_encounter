require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  context "保存できるとき" do
    it "すべて入力した場合" do
      expect(@user).to be_valid  
    end
  end

  context "保存できないとき" do
    it "nickname：必須" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Nickname can't be blank")
    end
    it "nickname：一意性" do
      @user.save
      @user2 = FactoryBot.build(:user,nickname: @user.nickname)
      @user2.valid?
      expect(@user2.errors.full_messages).to include ("Nickname はすでに使用されています。")
    end
    it "nickname：一意性(大文字小文字の区別）" do
      @user.nickname = 'testname'
      @user.save
      @user2 = FactoryBot.build(:user,nickname: 'Testname')
      @user2.valid?
      expect(@user2.errors.full_messages).to include ("Nickname はすでに使用されています。")
    end
    it "gender_id：必須" do
      @user.gender_id = ""
      @user.valid?
      expect(@user.errors.full_messages).to include ("Gender can't be blank")
    end
    it "gender_id：は０を選択しているか" do
      @user.gender_id = 0
      @user.valid?
      expect(@user.errors.full_messages).to include ("Gender を選択してください。")
    end
    it "age：必須" do
      @user.age = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Age can't be blank")  
    end
    it "email：必須" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")  
    end
    it "email：は@が必須" do
      @user.email = 'aaa.ssss'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email is invalid")  
    end
    it "password：必須" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password can't be blank")  
    end
    it "password：は６文字必須" do
      @user.password = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")  
      
    end
    
    it "password：が半角英数字混合必須" do
      @user.password = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password は半角英数字を必ずふくめてください。")  
    end
    it "password_confirmation：の一致必須" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")  
    end
    
    
    
  end
  
  
end
