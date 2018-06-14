class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :index
      t.string :show
      t.string :new
      t.string :create
      t.string :edit
      t.string :update
      t.string :destroy

      t.timestamps null: false
    end
  end
end
