class Event < ActiveRecord::Base
	belongs_to :user 
	has_many :participants
	has_many :users, through: :participants
	validates :user_id, :presence => true

def days_from_now
	if eventdate != nil
		day_from_now = (eventdate - Date.current).to_i
			if day_from_now == 0
				return "Vandaag"	
			elsif day_from_now == 1
				return "Morgen"
			elsif day_from_now >= 2
				return "over " + day_from_now.to_s + " dagen"
			else 
				return nil 	
			end
		end
	end
end
