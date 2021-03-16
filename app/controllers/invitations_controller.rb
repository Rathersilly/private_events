class InvitationsController < ApplicationController
  before_action :set_invitation, only: %i[ show edit update destroy ]
  def new
    @invitation = Invitation.new
    @event = Event.find(params[:event_id])
    @host = @event.host
  end
  def create
    
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      flash[:success] = "Invitation created!"
      redirect_to event_url(@invitation.host_id)
    else
      flash[:warning] = "Could not create invitation"
      render 'new'
    end
  end

  def edit
  end
  def update
    if @invitation.update(invitation_params)
      render :show, status: :ok, location: @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def set_invitation
    @invitation = Invitation.find(params[:id])
  end
  def invitation_params

    params.require(:invitation).permit(:event_id, :host_id, :invitee_id)
  end

end
