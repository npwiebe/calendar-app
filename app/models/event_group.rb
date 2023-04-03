class EventGroup < ApplicationRecord
  has_many :events
  has_many :participants, through: :events
end
