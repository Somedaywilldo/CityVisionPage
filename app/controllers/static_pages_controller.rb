class StaticPagesController < ApplicationController
  
  #skip_before_filter :verify_authenticity_token  
  
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page]) 
    end
  end

  def help
  end
    
  def about
  end
   
  def contact
  end

  def density_demo
  end  
  
end
