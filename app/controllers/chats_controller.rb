class ChatsController < ApplicationController
	

	def show 
		@micropost = Micropost.find(params[:id])
		@messages = Message.where(chat_id: params[:id])
		@message = Message.new
	end

	def create
		@message = Message.create(chat_id: params[:id])
		if @message.save
			@messages = Message.where(chat_id: params[:id])
			redirect_to(:back)
		else
			@messages = Message.where(chat_id: params[:id])
			redirect_to(:back)
		end
	end

	

end