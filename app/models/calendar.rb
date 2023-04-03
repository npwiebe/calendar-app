class Calendar < ApplicationRecord
  belongs_to :user
  has_many :participants
  has_many :events, through: :participants
end
