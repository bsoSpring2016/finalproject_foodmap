class User < ActiveRecord::Base

  validates :email, :presence => true, :uniqueness=> true

  has_many :maps , :class_name => "Map", :foreign_key => "user_id"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
