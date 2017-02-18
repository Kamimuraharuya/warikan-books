class LikesController < ApplicationController

def create
	@like = Like.create(user_id: current_user.id, micropost_id: params[:micropost_id])
    @likes = Like.where(micropost_id: params[:micropost_id])
    @microposts = Micropost.all
    redirect_to micropost_url(id: params[:micropost_id])
end
end

