class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #remove :trackable

  has_many :tweets
  mount_uploader :avatar, AvatarUploader 
  validates :username, presence: true, uniqueness: true 
  serialize :following, Array 
end