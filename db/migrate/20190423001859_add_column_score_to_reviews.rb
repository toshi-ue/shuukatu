class AddColumnScoreToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :score, :integer, after: :user_id
  end
end
