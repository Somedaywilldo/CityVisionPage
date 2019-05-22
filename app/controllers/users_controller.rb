class UsersController < ApplicationController
  #前置过滤器
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user, only: :destroy
  def index 
    #@users = User.paginate(page: params[:page])
    @users = User.paginate(page: params[:page])
    #@users = User.where(activated: FILL_IN).paginate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    #redirect_to root_url and return unless FILL_IN
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end
  
  #skip_before_filter :verify_authenticity_token  
 # config.middleware.use ActionDispatch::Flash
  
  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "请查收激活邮件，激活你的账户。"
      redirect_to root_url

      #flash[:success] = "Welcome to the Sample App!"
      
    # 处理注册成功的情况 
    else
      render 'new' 
      #debugger
    end
  end 
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "个人信息"
      redirect_to @user
  # 处理更新成功的情况 
    else
      render 'edit' 
    end
  end
  
  
  
  def edit
    @user = User.find(params[:id])
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                           :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "请登录。"
        redirect_to login_url
      end
    end
    # 确保是正确的用户 
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) 
    end
  
# 确保是管理员 
    def admin_user
      redirect_to(root_url) unless current_user.admin? 
    end
  
  #def index
  #end
  
end