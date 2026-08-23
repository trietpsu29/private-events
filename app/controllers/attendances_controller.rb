class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [ :create ]
  def create
    @attendance = current_user.attendances.build(attended_event: Event.find(params[:event_id]))
    @attendance.save
    redirect_to event_path(@attendance.attended_event)
  end
end
