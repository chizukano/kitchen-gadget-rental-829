class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @gadget = @booking.gadget
    authorize @booking
  end

  def new
    @gadget = Gadget.find(params[:gadget_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @gadget = Gadget.find(params[:gadget_id])
    @booking = Booking.new(booking_params)
    @booking.gadget = @gadget
    @booking.customer = current_user
    authorize @booking

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render "gadgets/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_on, :end_on)
  end
end
