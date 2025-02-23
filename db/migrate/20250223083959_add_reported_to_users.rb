class AddReportedToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :reported, :boolean
  end
end
