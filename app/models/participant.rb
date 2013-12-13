class Participant < ActiveRecord::Base
	#belongs to :users#, class_name => "user"
	#belongs to :events#, class_name => "event"
	belongs_to :event
	belongs_to :user
end
