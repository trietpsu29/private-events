class Event < ApplicationRecord
  belongs_to :creator
  has_many :attendances
  has_many :attendees, through: :attendances, source: :attendee

  scope :past, -> { where("date < ?", Time.current) }
  scope :future, -> { where("date >= ?", Time.current) }
end
