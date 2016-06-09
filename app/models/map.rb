class Map < ActiveRecord::Base
  has_many :venues , :class_name => "Venue", :foreign_key => "map_id"
  belongs_to :user , :class_name => "User", :foreign_key => "user_id"

validates :map_description, :presence => true, length: { maximum: 350}
validates :map_image,  :presence => true
validates :map_name, :presence => true, length: { maximum: 50}
end
