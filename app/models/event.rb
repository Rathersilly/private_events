class Event < ApplicationRecord

  #belongs_to :host, class_name: "User", foreign_key: { to_table: :users }
  #has_many :invitees, class_name: "User", foreign_key: { to_table: :users }
  #belongs_to :host, inverse_of: :User, foreign_key: "host_id"
  belongs_to :host, class_name: "User", foreign_key: "host_id"
  has_many :invitations
  has_many :invitees, class_name: "User", through: :invitations, foreign_key: "invitee_id"

  scope :previous, -> { where("time < ?", DateTime.now) }
  scope :upcoming, -> { where("time > ?", DateTime.now) }

  def past?
    time < DateTime.now
  end

  def future?
    time > DateTime.now
  end
end 
