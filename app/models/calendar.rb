class Calendar < ApplicationRecord
  belongs_to :user
  has_many :events, through: :calendar_events
end
