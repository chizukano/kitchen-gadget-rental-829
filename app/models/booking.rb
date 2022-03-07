class Booking < ApplicationRecord
  belongs_to :gadget
  belongs_to :customer
end
