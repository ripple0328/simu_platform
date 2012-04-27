class AddAuthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :auth, :boolean
  end
end
