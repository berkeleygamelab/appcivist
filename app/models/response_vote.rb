class ResponseVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :response_template, :foreign_key => :response_id
end
