class SentMessage < ActiveRecord::Base
	belongs_to :sender, :polymorphic => true
	has_many :received_messages
end
