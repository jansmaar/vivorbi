class Event < ActiveRecord::Base
	belongs_to :user 
	#has many :participants through :users
	validates :user_id, :presence => true
end
