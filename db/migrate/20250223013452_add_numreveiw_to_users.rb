class AddNumreveiwToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :numreveiw, :integer
  end
end
