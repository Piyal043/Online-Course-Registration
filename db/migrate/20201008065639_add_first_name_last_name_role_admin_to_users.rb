class AddFirstNameLastNameRoleAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :roll, :integer
    add_column :users, :admin, :boolean
  end
end