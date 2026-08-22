class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  def index
    @events = Event.all
  end

  def new
    @events = Event.new
  end

  def create
    @event = current_user.created_events.build(events_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def events_params
      params.expect(event: [ :title, :description, :date, :location ])
    end
end
