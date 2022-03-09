class GadgetsController < ApplicationController
  def index
    @gadgets = policy_scope(Gadget)
  end

  def show
    @gadget = Gadget.find(params[:id])
    authorize @gadget
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
