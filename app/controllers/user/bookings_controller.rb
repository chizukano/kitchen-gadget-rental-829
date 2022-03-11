class User::BookingsController < ApplicationController
  def index
    skip_policy_scope
  end

  def approve
    @booking = Booking.find(params[:id])
    authorize @booking

    @booking.approved!
    redirect_to user_bookings_path, notice: "Booking accepted!"
  end

  def reject
    @booking = Booking.find(params[:id])
    authorize @booking

    @booking.rejected!
    redirect_to user_bookings_path, notice: "Booking rejected"
  end
end
