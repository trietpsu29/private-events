class InvitationsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]

  def new
    @event = Event.find(params[:event_id])
    @invitation = Invitation.new
  end

  def create
    @event = Event.find(params[:event_id])

    unless @event.creator == current_user
      flash.now[:alert] = "You aren't the creator"
      return render :new, status: :unprocessable_entity
    end

    @invitee = User.find_by(name: params[:invitee_name])

    unless @invitee
      flash.now[:alert] = "User doesn't exist"
      return render :new, status: :unprocessable_entity
    end

    @invitation = @invitee.invitations.build(invited_event: @event)
    @invitation.save
    redirect_to event_path(@event)
  end
end
