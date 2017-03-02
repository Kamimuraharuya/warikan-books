class LikesController < ApplicationController

	def create
		@like = Like.create(user_id: current_user.id, micropost_id: params[:micropost_id])
		@likes = Like.where(micropost_id: params[:micropost_id])
		@microposts = Micropost.all
		@micropost = Micropost.find(params[:micropost_id])
		#unless @micropost.person_number.to_i  == @micropost.likes_count.to_i + 1
			#redirect_to controller: :microposts, action: :show, id: params[:micropost_id]
		#else

users = []
		likes = @micropost.likes
		host = @micropost.user
		users = User.where(id: likes.pluck(:user_id) << host.id )
        micropost = @micropost
		emails = users.pluck(:email)

		users.each do |user|
			NoticeMailer.chat_created(user, emails,micropost,users).deliver
		end

		flash[:success] = "ワリカンが成立しました"
		redirect_to controller: :microposts, action: :show, id: params[:micropost_id]
		#end
	end 




end
