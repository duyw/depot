class StoreController < ApplicationController
  
  skip_before_filter :authorize
  
  @@active = "active"
  def index
    @products = Product.all
    @cart = current_cart
  end

end
