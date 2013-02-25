class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :business_name, :string
    add_column :users, :doing_business_as, :string
    add_column :users, :website_url, :string
    add_column :users, :category, :string
    add_column :users, :avg_monthly_sales, :integer
    add_column :users, :tax_id, :string
    add_column :users, :state, :string
    add_column :users, :zip_code, :string
    add_column :users, :address, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :plan_id, :integer
  end
end
