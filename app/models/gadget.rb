class Gadget < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :bookings
  geocoded_by :address

  delegate :address, to: :owner
  after_validation :geocode

  # def address
  #   owner.address
  # end
end
