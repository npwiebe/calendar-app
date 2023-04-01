class CalendarEvent < ApplicationRecord
  belongs_to :calendar
  belongs_to :event

  validates :event, presence: true 
  validates :calendar, presence: true 
end
