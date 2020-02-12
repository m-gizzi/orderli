class ModificationsController < ApplicationController

  def new
    @modification = Modification.new
    @orders = Order.all
    @mod_prices = [0.00, 0.50, 1.00, 1.50, 2.00, 2.50, 3.00, 4.00, 5.00]
  end

  def edit
    @modification = Modification.find(params[:id])
  end

  def create
    @modification = Modification.new(modification_params)
    @modification.save
    redirect_to order_path(@modification.order_id)
  end

  private

  def modification_params
    params.require(:modification).permit(:note, :price, :order_id)
  end
end
