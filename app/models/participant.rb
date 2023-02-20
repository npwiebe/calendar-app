class Participant < ApplicationRecord
  belongs_to :event
  belongs_to :participatable, polymorphic: true
end
