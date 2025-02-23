class AddReveiwToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :reveiw, :integer
  end
end
