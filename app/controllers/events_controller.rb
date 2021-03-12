class EventsController < ApplicationController
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
  def destroy
  end

  private
  def event_params
    params.require(:event).permit(:host_id, :place, :time)
  end

end
