class GadgetsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @gadgets = Gadget.all
    @gadgets = policy_scope(Gadget)

    @markers = @gadgets.geocoded.map do |gadget|
      { lat: gadget.latitude,
        lng: gadget.longitude,
        info_window: render_to_string(
          partial: "info_window",
          locals: { gadget: gadget }
        )
      }
    end
  end

  def show
    @gadget = Gadget.find(params[:id])
    @booking = Booking.new
    authorize @gadget
  end

  def new
    @gadget = Gadget.new
    @gadget.owner = current_user
    authorize @gadget
  end

  def create
    @gadget = Gadget.new(gadget_params)
    @gadget.owner = current_user
    @gadget.owner.update(owner_params) unless owner_params[:address].blank?
    authorize @gadget

    if @gadget.save
      redirect_to gadgets_path
    else
      render :new
    end
  end

  private

  def gadget_params
    params.require(:gadget).permit(:name, :description, :photo)
  end

  def owner_params
    params[:gadget].require(:owner_attributes).permit(:address)
  end
end
