class Event < ApplicationRecord
  has_many :participants

  #EVENT_TYPES = {'Financial' : ['Payment'],'Social':[ 'Meeting', 'Hangout'], 'School': ['Class', 'Homework'], 'Work': ['Performance Review']}
end
