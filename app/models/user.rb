class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  validates :name, presence: true, uniqueness: true
  has_many :created_events, foreign_key: :creator_id, class_name: "Event"

  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances, source: :attended_event

  has_many :invitations, foreign_key: :invitee_id
  has_many :invited_events, through: :invitations, source: :invited_event
end
