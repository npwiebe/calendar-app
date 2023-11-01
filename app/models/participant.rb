class Participant < ApplicationRecord
  belongs_to :participatable, polymorphic: true
  belongs_to :event

  PARTICIPANT_ACCESS_LEVEL = [
    OWNER = "owner",
    EDITOR = "editor",
    PRESENTER = "presenter",
    PARTICIPANT_ONLY = "participant_only"
  ]

  PARTICIPANT_STATUSES = [
    ATTENDING = "attending",
    LIKELY_ATTENDING = "likely_attending",
    UNLIKELY_ATTENDING = "unlikely_attending",
    NOT_ATTENDING = "not_attending"
  ]

  scope :owners, -> { where(role: OWNER) }
  scope :editors, -> { where(role: EDITOR) }
  scope :presenters, -> { where(role: PRESENTER) }
  scope :participant_only, -> { where(role: PARTICIPATE_ONLY) }
end
