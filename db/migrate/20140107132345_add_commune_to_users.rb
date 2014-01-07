class AddCommuneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :commune, :string
  end
end
