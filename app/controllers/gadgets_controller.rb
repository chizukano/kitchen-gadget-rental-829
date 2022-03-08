class GadgetsController < ApplicationController
  def index
    @gadgets = Gadget.all
  end

  def show
    @gadget = Gadget.find(params[:id])
  end
end
