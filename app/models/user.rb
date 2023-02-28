class User < ApplicationRecord
  include Participatable
  include Ownable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :calendars
  has_many :api_keys
end
