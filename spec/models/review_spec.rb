require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "score 属性の範囲値" do
    context "有効 (OK)の場合" do
      it "1 ~ 5" do
        # review = FactoryBot.build(:review, score: 5)
        review = FactoryBot.create(:review, score: 5)
        expect(review).to be_valid
      end
    end

    context "無効 (NG)の場合" do
      it "0" do
        review = FactoryBot.build(:review, score: 0)
        review.valid?
        expect(review.errors[:score]).to include("must be greater than or equal to 1")
      end

      it "6" do
        review = FactoryBot.build(:review, score: 6)
        review.valid?
        expect(review.errors[:score]).to include("must be less than or equal to 5")
      end

      it "nil" do
        review = FactoryBot.build(:review, score: "aaa")
        review.valid?
        expect(review.errors[:score]).to include("is not a number")
      end
    end
  end

  describe "comment 属性の文字数" do
    context "有効 (OK)の場合" do
      it "21文字以上" do
        review = FactoryBot.create(:review, comment: "a" * 21)
        review.valid?
        expect(review).to be_valid
        # expect(review.errors[:score]).to include("is not a number")
      end

      it "100文字以下" do
        review = FactoryBot.create(:review, comment: "a" * 100)
        expect(review).to be_valid
      end

    end

    context "無効 (NG)の場合" do
      it "20文字以下" do
        review = FactoryBot.build(:review, comment: "あ" * 20)
        review.valid?
        expect(review.errors[:comment]).to include("is too short (minimum is 21 characters)")
      end

      it "101文字以上" do
        review = FactoryBot.build(:review, comment: "あ" * 101)
        review.valid?
        expect(review.errors[:comment]).to include("is too long (maximum is 100 characters)")
      end

      it "nil" do
        review = FactoryBot.build(:review, comment: nil)
        review.valid?
        expect(review.errors[:comment]).to include("is too short (minimum is 21 characters)")
      end
    end
  end
end
