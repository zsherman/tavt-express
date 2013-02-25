class AddCityAndActiveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :city, :string
    add_column :users, :active, :boolean
  end
end
