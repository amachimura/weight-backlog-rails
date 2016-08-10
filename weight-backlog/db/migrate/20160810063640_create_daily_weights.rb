class CreateDailyWeights < ActiveRecord::Migration
  def change
    create_table :daily_weights do |t|
      t.integer :user_id
      t.integer :sprint_id
      t.date :date
      t.decimal :weight

      t.timestamps null: false
    end
  end
end
