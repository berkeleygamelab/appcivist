class Betauser < ActiveRecord::Base
  validates_presence_of  :email
  belongs_to :user
  after_create :send_applicant

  def send_applicant
    mail = UserMailer.beta_notification(self)
    mail.deliver
  end
end
