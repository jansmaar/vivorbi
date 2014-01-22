class Hotspot < ActiveRecord::Base


  has_attached_file :ad,
  :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename",
      :default_url => 'vivorbi.jpg'

end
