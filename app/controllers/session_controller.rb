class SessionController < ApplicationController

  skip_before_filter :authorize

  def new
  end

  def create
    if user = User.authenticate(params[:name],params[:password])
      session[:current_user] = user
      redirect_to admin_url
    else
      redirect_to login_url, :alert => "用户名或密码错误"
    end
  end

  def destroy
    session[:current_user] = nil
    redirect_to store_url, :notice => "登录已经注销"
  end

end
