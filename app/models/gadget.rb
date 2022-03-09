class Gadget < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :bookings
  has_one_attached :photo
  geocoded_by :address

  delegate :address, to: :owner
  before_create :geocode

  # def address
  #   owner.address
  # end
end
