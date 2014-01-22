class CreateHotspots < ActiveRecord::Migration
  def change
    create_table :hotspots do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
