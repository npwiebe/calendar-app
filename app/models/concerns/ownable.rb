module Ownable
  extend ActiveSupport::Concern

  included { has_many :events, as: :ownable }
end
