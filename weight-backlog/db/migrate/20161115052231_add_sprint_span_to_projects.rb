class AddSprintSpanToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :days_of_sprint, :integer
  end
end
