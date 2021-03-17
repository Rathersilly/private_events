class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :host, class_name: "User", foreign_key: "host_id"
  belongs_to :invitee, class_name: "User", foreign_key: "invitee_id"


end
