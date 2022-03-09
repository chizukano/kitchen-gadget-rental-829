class GadgetsController < ApplicationController
  def index
    @gadgets = policy_scope(Gadget)
  end

  def show
    @gadget = Gadget.find(params[:id])
    authorize @gadget
  end
end
