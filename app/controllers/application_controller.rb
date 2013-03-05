class ApplicationController < ActionController::Base
  
  before_filter :authorize
  
  protect_from_forgery

  private

    def current_cart
      Cart.find(session[:cart_id])
    rescue
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

  protected

    def authorize
      unless session[:current_user]
        redirect_to login_url, :notice => "Please Log in"
      end
    end

end
