class UpdateUserTableColumns < ActiveRecord::Migration[7.1]
  def down
    change_column :users, :first_name, :string
    change_column :users, :last_name, :string
    change_column :users, :role
  end

  def up
    change_column :users, :role, :string, default: 'user', null: false
    change_column :users, :first_name, :string, null: true
    change_column :users, :last_name, :string, null: true
  end
end
