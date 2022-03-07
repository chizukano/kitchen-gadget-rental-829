class Booking < ApplicationRecord
  belongs_to :gadget
  belongs_to :customer, class_name: "User"
end
