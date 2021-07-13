class Invite < ApplicationRecord
  belongs_to :user
  belongs_to :movie_party
end