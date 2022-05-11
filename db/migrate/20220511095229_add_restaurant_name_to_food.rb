class AddRestaurantNameToFood < ActiveRecord::Migration[6.1]
  def change
    add_column :foods, :restaurant_name, :string
  end
end
