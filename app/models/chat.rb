class Chat < ApplicationRecord
validates :person_name, :presence => true, :length => { :maximum => 10 }
  validates :body, :presence => true, :length => { :maximum => 100 }

  def self.chat_list
    return Chat.all.order(:created_at => :desc)
  end


	

end
