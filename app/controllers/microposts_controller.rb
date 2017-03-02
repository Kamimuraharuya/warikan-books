class MicropostsController < ApplicationController

	before_action :logged_in_user, only:[:create, :destroy]
	before_action :correct_user,   only: :destroy


	def show
		@micropost = Micropost.find(params[:id])
		@likes = Like.where(micropost_id: params[:id])
	end 

	def index
		@likes = Like.where(micropost_id: params[:id])
		@q = Micropost.ransack(params[:q])
		@microposts = @q.result.paginate(page: params[:page])
	end
	def tatiage
		@micropost = current_user.microposts.build#(micropost_params)
	end

	def create
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			flash[:success] = "Micropost created!"
			redirect_to micropost_path(id: @micropost.id)
		else
			@feed_items = []
			render "/microposts/tatiage"
		end
	end

	def destroy
		@micropost.destroy
		flash[:success] = "Micropost deleted"
		redirect_to request.referrer || root_url
	end


	private

	def micropost_params
		params.require(:micropost).permit(:content, :picture,:bookname,:area, :bookprice, :day, :kakikomi,:person_number )
	end

	def correct_user
		@micropost = current_user.microposts.find_by(id: params[:id])
		redirect_to root_url if @micropost.nil?
	end
end
