class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :host, class_name: "User", foreign_key: "host_id"
  belongs_to :invitee, class_name: "User", foreign_key: "invitee_id"

  scope :accepted, -> { where(accepted: true) }
  scope :pending, -> { where(accepted: false) }

  #event.time does not exist
  #scope :past, -> { where("event.time < ?", DateTime.now) }

  def past?
    event.time < DateTime.now
  end

  def future?
    event.time > DateTime.now
  end
end 


