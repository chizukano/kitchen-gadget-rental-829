class BookingsController < ApplicationController
  def new
    @gadget = Gadget.find(params[:gadget_id])
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
    @gadget = Gadget.find(params[:id])
  end

  def create
    @gadget = Gadget.find(params[:gadget_id])
    @booking = Booking.new(booking_params)
    @gadget.booking = @booking

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_on, :end_on)
  end
end
