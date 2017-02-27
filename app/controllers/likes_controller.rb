class LikesController < ApplicationController

	def create
		@like = Like.create(user_id: current_user.id, micropost_id: params[:micropost_id])
		@likes = Like.where(micropost_id: params[:micropost_id])
		@microposts = Micropost.all
		@micropost = Micropost.find(params[:micropost_id])
		#unless @micropost.person_number.to_i  == @micropost.likes_count.to_i + 1
		#	redirect_to controller: :microposts, action: :show, id: params[:micropost_id]
		 #else
		#@micropost = current_user.microposts.build(micropost_params)


		like = Like.find_by(micropost_id: params[:micropost_id])
		#このホストと参加者のところにうまくユーザーを設定したい
		#user_idがメソッドとして扱われてまう,user_idをいかにもってくるかが問題である
		user = @micropost.user
		users = like.user
		#漸次的においてるけど、誰かに質問したい＠＠＠取り出してんのがIDだけになってるのが原因んだと思われれう
		hostman = User.find_by(id: user.id)
		participant  = User.find_by(id: users.id) 
		  
		@mail = NoticeMailer.chat_created(hostman, participant).deliver
		flash[:success] = "ワリカンが成立しました"
		#redirect_to controller: :microposts, action: :show, id: params[:micropost_id]
		redirect_to controller: :chats, action: :show, id: params[:micropost_id]
#end

end




end
