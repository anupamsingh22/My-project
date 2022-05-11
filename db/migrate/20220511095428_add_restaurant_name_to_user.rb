class AddRestaurantNameToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :restaurant_name, :string
  end
end
