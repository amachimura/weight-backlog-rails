class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :project_name
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
