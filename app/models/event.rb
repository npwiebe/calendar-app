class Event < ApplicationRecord
  has_many :participants
  has_many :calendars, through: :calendar_events
  belongs_to :ownable, polymorphic: true

  #EVENT_TYPES = {'Financial' : ['Payment'],'Social':[ 'Meeting', 'Hangout'], 'School': ['Class', 'Homework'], 'Work': ['Performance Review']}
end
