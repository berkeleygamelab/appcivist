class Proposal < ActiveRecord::Base
  belongs_to :challenge
  has_many :votes
  has_one :item_template, :as => :item
  
  validates :challenge_id, :presence => true
  validates :title, :presence => true
  validate :prior_deadline
  
  def total
     return votes.size
   end
  
  def prior_deadline
    if Time.now > challenge.submission_deadline
      errors.add(:challenge_id, "Past proposal submission deadline")
    end
  end
  
  def vote_for_proposal(with_user)
    VotingRecord.create(:proposal_id => id, :user_id => with_user.id)
  end
  
end
