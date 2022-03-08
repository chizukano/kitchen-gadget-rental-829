class BookingsController < ApplicationController
  def new
    @gadget = Gadget.find(params[:gadget_id])
    @booking = Booking.new
  end

  def create
    @gadget = Gadget.find(params[:gadget_id])
    @booking = Booking.new(booking_params)
    @gadget.booking = @booking
    @booking.saves

    #For the future link for bookings/show page
    # if @booking.saves
    #   redirect_to booking_path(@booking)
    # else
    #   render :new
    # end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_on, :end_on)
  end
end
