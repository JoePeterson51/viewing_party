class User < ApplicationRecord
  has_many :viewing_parties
  has_many :invites
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates_confirmation_of :password

  has_secure_password
end