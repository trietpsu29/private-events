class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [ :attend ]
  def attend
    @attendance = current_user.attendances.build
    @attendance.attended_event = Event.find(params[:event_id])
    if @attendance.save
      redirect_to event_path(@attendance.attended_event)
    end
  end
end
