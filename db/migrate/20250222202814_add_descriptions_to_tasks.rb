class AddDescriptionsToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :short_description, :string
    add_column :tasks, :long_description, :text
  end
end
