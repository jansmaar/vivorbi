class Event < ActiveRecord::Base
	belongs_to :user 
	has_many :participants
	has_many :users, through: :participants
	validates :user_id, :presence => true
end
