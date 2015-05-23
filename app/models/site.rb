class Site < ActiveRecord::Base

	has_many :ownerships  
  has_many :users, :through => :ownerships
  has_one :photo
  accepts_nested_attributes_for :photo
  has_many :releves

  accepts_nested_attributes_for :ownerships

  

	# geocoded_by :location
	# after_validation :geocode

	mount_uploader :photo, ImageUploader
	# process_in_background :photo

	mount_uploader :plan, ImageUploader
	# process_in_background :plan

	reverse_geocoded_by :latitude, :longitude, :address => :location
	after_validation :reverse_geocode  # auto-fetch address


end
