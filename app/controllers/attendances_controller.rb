class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [ :create ]
  def create
    @attendance = current_user.attendances.build(attended_event: Event.find(params[:event_id]))
    @attendance.save
    redirect_to event_path(@attendance.attended_event)
  end

  def destroy
    @attendance = current_user.attendances.find(params[:id])
    @attendance.destroy
    redirect_to events_path, notice: "You just left..."
  end
end
