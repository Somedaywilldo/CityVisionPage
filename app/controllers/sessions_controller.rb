class SessionsController < ApplicationController
  def new
  end
  #skip_before_filter :verify_authenticity_token  
  def create
    user = User.find_by(email: params[:session][:email].downcase) 
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user) 
        redirect_back_or user
      else
        message  = "账户未激活。"
        message += "请查收注册邮箱中的激活链接~"
        flash[:warning] = message
        redirect_to root_url
      end
    else
# 创建一个错误消息
      flash.now[:danger] = '邮箱或密码不正确！'
      render 'new' 
    end
  end
  
  def destroy
    log_out if logged_in? 
    redirect_to root_url
  end
  
end