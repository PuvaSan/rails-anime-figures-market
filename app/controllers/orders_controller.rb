class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  # def new
  #   @order = Order.new
  #   @figure = Figure.find(params[:figure_id])
  # end

  def create
    @order = Order.new(order_params)
    @figure = Figure.find(params[:figure_id])
    @order.figure = @figure
    @order.buyer = current_user
    if @order.save
      redirect_to purchased_figures_path
    else
      render 'figures/show', status: :unprocessable_entity
    end
  end

  def update
    @order = Order.find(params[:id])
    redirect_to listed_figures_path if @order.update(order_params)
  end

  private

  def order_params
    params.require(:order).permit(:mode_of_delivery, :status)
  end
end
