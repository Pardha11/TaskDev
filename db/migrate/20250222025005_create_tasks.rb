class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.decimal :price

      t.timestamps
    end
  end
end
