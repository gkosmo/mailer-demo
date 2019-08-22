class ProductsController < ApplicationController
    skip_before_action :authenticate_user!, only: :index
  def index
        @products = Product.all
  end

  def new
      @product = Product.new
  end

  def create

    Product.new(pro_params).save
    redirect_to root_path
  end

  private

  def pro_params
    params.require(:product).permit(:name, :tagline)
  end
end
