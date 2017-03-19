class Api::V1::Customers::FavoriteController < ApplicationController
  def show
    customer = Customer.find(params[:id])
    render json: customer.favorite_merchant
  end
end
