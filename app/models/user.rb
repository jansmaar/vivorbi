class User < ActiveRecord::Base
	has_many :events
	belongs_to :dashboards
	#has many :participants through :events
	#has_many :participants, through: => :events
	
	attr_accessor :password
  
  has_attached_file :avatar,
  :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"
 	before_save :encrypt_password
	
	
 
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }


def self.authenticate(email, password)
  user = find_by_email(email)
  if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
    user
  else
    nil
  end
 end

def age
  ((Time.now - date_of_birth.to_time)/(60*60*24*365)).floor
end



def encrypt_password
  	if password.present?
  	  self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
end
end
