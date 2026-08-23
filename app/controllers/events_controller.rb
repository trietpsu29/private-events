class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :update, :destroy ]
  before_action :set_event, only: [ :edit, :update, :destroy, :show ]
  before_action :authorize_event, only: [ :edit, :update, :destroy ]
  def index
    @events = Event.public_events.includes(:creator, :attendees)
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      flash.now[:alert]= "Something went wrong"
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      flash.now[:alert]= "Something went wrong"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @event.destroy
      redirect_to events_path
    else
      redirect_to event_path(@event), alert: "Something went wrong"
    end
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def authorize_event
      return if @event.creator == current_user

      redirect_to events_path, alert: "You aren't the creator"
    end

    def event_params
      params.expect(event: [ :title, :description, :date, :location, :is_private ])
    end
end
