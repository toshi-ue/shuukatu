require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "Post create" do
    context "carrierwaveによる画像のアップロードテスト" do
      context "画像が追加されている" do
        it '登録が完了する' do
          @item = FactoryBot.build(:item)
          @item.valid?
          expect(@item).to be_valid
        end
      end
    end
  end
end
