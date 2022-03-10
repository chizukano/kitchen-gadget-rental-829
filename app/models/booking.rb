class Booking < ApplicationRecord
  belongs_to :gadget
  belongs_to :customer, class_name: "User"
  has_one :owner, through: :gadget

  enum status: {
    pending: 0,
    approved: 10,
    rejected: 20
  }
end
