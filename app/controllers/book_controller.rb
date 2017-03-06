class BookController < ApplicationController
  

  def home
    @microposts = Micropost.all
    @feed_items = @microposts.paginate(page: params[:page])
    if logged_in?
      @micropost = current_user.microposts.build
    end
  end

  def help
  end

  def about
  end

  def contact
  end


end
