class User < ApplicationRecord
  has_many :events, foreign_key: :host_id
  #has_many :invites, class_name: "Event", through: :invitations, foreign_key: :invitee_id
  has_many :invites, class_name: "Invitation", foreign_key: :invitee_id
  #has_many :accepted_invites, class_name: 
  #has_many :invites, class_name: "Event", through: :invitations, foreign_key: :event_id, inverse_of: :invitee
  has_many :invited_events, through: :invites, source: :event
  #has_many :accepted_events, through: :invites, -> { where accepted: true}, source: :event

  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 4 }
  
  # can prob find a way to do these with has_many
  def accepted
    invites.select { |x| x.accepted == true }
  end
  def pending
    invites.select { |x| x.accepted == false }
  end
  def accepted_events
    accepted.each_with_object([]) { |x, a| a << Event.find(x.event_id) }
  end
  def pending_events
    pending.each_with_object([]) { |x, a| a << Event.find(x.event_id) }
  end

end
