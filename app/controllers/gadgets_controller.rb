class GadgetsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @gadgets = Gadget.all

    @markers = @gadgets.geocoded.map do |gadget|
      {
        lat: gadget.latitude,
        lng: gadget.longitude
      }
    end
  end

  def show
    @gadget = Gadget.find(params[:id])
  end

  def new
    @gadget = Gadget.new
  end

  def create
    @gadget = Gadget.new(gadget_params)
    @gadget.owner = current_user
    if @gadget.save
      redirect_to gadgets_path
    else
      render :new
    end
  end

  private

  def gadget_params
    params.require(:gadget).permit(:name, :description)
  end
end
