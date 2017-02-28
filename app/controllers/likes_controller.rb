class LikesController < ApplicationController

	def create
		@like = Like.create(user_id: current_user.id, micropost_id: params[:micropost_id])
		@likes = Like.where(micropost_id: params[:micropost_id])
		@microposts = Micropost.all
		@micropost = Micropost.find(params[:micropost_id])
		unless @micropost.person_number.to_i  == @micropost.likes_count.to_i + 1
			redirect_to controller: :microposts, action: :show, id: params[:micropost_id]
		 else
		like = Like.find_by(micropost_id: params[:micropost_id])
		user = @micropost.user
		users = like.user

		hostman = User.find_by(id: user.id)
		participant  = User.find_by(id: users.id) 
		 
		@mail = NoticeMailer.chat_created(hostman, participant).deliver
		flash[:success] = "ワリカンが成立しました"
		redirect_to controller: :microposts, action: :show, id: params[:micropost_id]
end

end




end
