class AddTitleToTask < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :title, :string
  end
end
