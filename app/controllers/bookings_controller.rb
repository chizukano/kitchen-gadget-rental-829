class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end
 def show
  @booking = Booking.find(params[:id])
  @gadget = Gadget.find(params[:id])
 end

end
