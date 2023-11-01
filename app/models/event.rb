class Event < ApplicationRecord
  has_many :participants
  belongs_to :event_template, optional: true

  validates :datetime, presence: true
  validates :title, presence: true
end
