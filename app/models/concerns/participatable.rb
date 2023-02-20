module Participatable
  extend ActiveSupport::Concern

  included { has_many :participants, as: :participatable }
end
