class AddTechToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :tech, :string
  end
end
