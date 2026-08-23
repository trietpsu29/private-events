class Invitation < ApplicationRecord
  belongs_to :invitee, class_name: "User"
  belongs_to :invited_event, class_name: "Event"
  validates :invitee_id, uniqueness: { scope: invited_event_id }
end
