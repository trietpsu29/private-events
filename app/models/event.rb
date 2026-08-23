class Event < ApplicationRecord
  belongs_to :creator
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, source: :attendee

  has_many :invitations, foreign_key: :invited_event_id
  has_many :invitees, through: :invitations, source: :invitee

  scope :past, -> { where("date < ?", Time.current) }
  scope :future, -> { where("date >= ?", Time.current) }
end
