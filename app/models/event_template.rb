class EventTemplate < ApplicationRecord
  has_many :events
  has_many :participants, through: :events
end
