class ChatsController < ApplicationController

#チャットがメッセージを作ってるわけではないから、チャットidが付いてない！！
	#@micropost = current_user.microposts.build(micropost_params)
	def show 
		@micropost = Micropost.find(params[:id])
		@messages = Message.all#find_by(chat_id: params[:id])
		@message = Message.new
	end

	def create
		@message = Message.new(chat_id: params[:id])
		if @message.save
			@messages = Message.all#find_by(chat_id: params[:id])
			redirect_to(:back)
		else
			@messages = Message.all#find_by(chat_id: params[:id])
			redirect_to(:back)
		end
	end

	

end