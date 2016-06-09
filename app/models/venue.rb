class Venue < ActiveRecord::Base


  belongs_to :map , :class_name => "Map", :foreign_key => "map_id"

  validates :venue_address, :presence => true, :allow_nil => false
  validates :venue_description, :presence => true
  validates :venue_name, :presence => true
  validates :venue_photo, :presence=> true 


end
