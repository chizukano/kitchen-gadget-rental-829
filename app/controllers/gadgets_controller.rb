class GadgetsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @gadgets = policy_scope(Gadget)
  end

  def show
    @gadget = Gadget.find(params[:id])
    authorize @gadget
  end

  def new
    @gadget = Gadget.new
    authorize @gadget
  end

  def create
    @gadget = Gadget.new(gadget_params)
    @gadget.owner = current_user
    authorize @gadget

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
