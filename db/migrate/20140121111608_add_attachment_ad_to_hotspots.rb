class AddAttachmentAdToHotspots < ActiveRecord::Migration
  def self.up
    change_table :hotspots do |t|
      t.attachment :ad
    end
  end

  def self.down
    drop_attached_file :hotspots, :ad
  end
end
