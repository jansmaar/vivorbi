class AddHousenumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :housenumber, :string
  end
end
