require 'rails_helper'

RSpec.describe User, type: :model do
  it "有効なファクトリを持つこと" do
    expect(FactoryBot.build(:user)).to be_valid
  end
  describe "validation" do

    before do
      @user = FactoryBot.build(:user)
    end

    context "valid" do
      context "when sign-up" do
        context "by email" do
          it "email, password, password_confirmation に全て値が入力されている" do
            expect(@user.valid?).to eq(true)
          end

          it "password が8文字以上" do
            expect(@user.password.length).to be >= 8
          end

          it "password が英数それぞれ1文字以上を含む" do
            expect(@user.password).to match(/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,126}+\z/i)
          end

          it "password, password_confirmation が同値" do
            @user.valid?
            expect(@user.password).to eq @user.password_confirmation
          end

          it "emailがuniqueであること" do
            user2 = FactoryBot.create(:user)
            user2.valid?
            expect(user2.email).to_not eq @user.email
          end

          it "password_digestで暗号化" do
            user =  FactoryBot.create(:user)
            expect(user.encrypted_password).to_not eq "password12"
          end
        end
      end
    end

    context "invalid" do
      context "when sign up" do
        context "by email" do
          it "email が未入力" do
            @user.email = nil
            expect(@user.valid?).to eq(false)
          end

          it "password が8文字以下" do
            @user.password = "a"
            expect(@user.valid?).to eq(false)
          end

          it "password, password_confirmation が異なる値" do
            @user.password = "a"
            @user.valid?
            expect(@user.password).to_not eq @user.password_confirmation
          end

          it "emailの重複" do
            user2 = FactoryBot.create(:user, email: @user.email)
            expect(@user.valid?).to eq(false)
          end
        end
      end
    end
  end
end
