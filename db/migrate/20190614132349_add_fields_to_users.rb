class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :car_plate, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :photo, :string
  end
end
