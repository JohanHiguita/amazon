class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    @order_item = current_order.order_items.new
  end
  def new
  	@product = Product.new
  end

  def create
  	@product = Product.create(product_params)
    redirect_to products_path
  end

  def show
    
  end
  private

  def product_params
    params.require(:product).permit(:name, :price, :active)
  end


end
