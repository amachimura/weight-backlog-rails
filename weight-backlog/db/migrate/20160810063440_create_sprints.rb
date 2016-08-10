class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.integer :user_id
      t.integer :project_id
      t.date :target_date
      t.decimal :target_weight
      t.boolean :is_active
      t.date :start_date
      t.decimal :start_weight
      t.decimal :end_weight

      t.timestamps null: false
    end
  end
end
