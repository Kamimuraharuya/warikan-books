class Message < ApplicationRecord
	belongs_to :chat
	validates :person_name, :presence => true, :length => { :maximum => 10 }
	validates :body, :presence => true, :length => { :maximum => 100 }
	default_scope -> { order(created_at: :desc) }


end
