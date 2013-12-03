class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :content
      t.string :location
      t.date :eventdate
      t.time :eventtime
      t.integer :user_id

      t.timestamps
    end
  end
end
