class EventsController < ApplicationController
  before_action :set_event, only: %i[show, edit, update, destroy]
  before_action :correct_user, only: %i[edit, update, destroy]
  def new
    @event = Event.new
  end
  def create
    event = Event.new(event_params)
    if event && event.save!
      flash[:success] = "Event created!"
      redirect_to events_path
    else
      render 'new'
    end
  end
  def show
    @event = Event.find(params[:id])
    @host = User.find(@event.host_id)

  end
  def destroy
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end
  def event_params
    params[:event][:host_id] = current_user.id
    params.require(:event).permit(:host_id, :name, :place, :time)
  end

  def correct_user
    @user = User.find(@event.host_id)
  end
end
