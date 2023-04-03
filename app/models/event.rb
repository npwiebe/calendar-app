class Event < ApplicationRecord
  has_many :participants
  has_many :calendars, through: :participants

  validates :datetime, presence: true
  validates :title, presence: true
end
