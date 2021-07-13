class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user_id, uniqueness: true, presence: true
  validates :friend_id, uniqueness: true, presence: true
end
