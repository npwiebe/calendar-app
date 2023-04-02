class User < ApplicationRecord
  include Participatable
  include Ownable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :calendars
  has_many :api_keys

  after_create :create_api_key

  private

  def create_api_key
    self.api_keys.create unless api_keys.present?
  end
end
