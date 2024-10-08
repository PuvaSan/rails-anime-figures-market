class Listed::FiguresController < ApplicationController
  def index
    # Figure.user_id == current_user.id
    @orders = Order.all
    # display figures in descending created_at order
    @figures = Figure.all.order(created_at: :desc)

    # collects all orders that match the current logged in user's ID for display
    @order_sales = @orders.select do |order|
      order.figure.user.id == current_user.id
    end

    # collects all figures that match the current logged in user's ID for display
    @user_figures = @figures.select do |figure|
      figure.user.id == current_user.id
    end

    # collects all reviews that match the current logged in user's ID for display
    @user_reviews = Review.all.select do |review|
      review.reviewee.id == current_user.id
    end
  end
end
