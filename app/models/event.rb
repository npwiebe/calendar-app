class Event < ApplicationRecord
  has_many :participants
  has_many :calendars, through: :calendar_events
  belongs_to :ownable, polymorphic: true

  validates :ownable, presence: true
  validates :datetime, presence: true
  validates :title, presence: true

  after_create do |record|
    participants.create(participatable: ownable, role: Participant::OWNER)
  end
end
