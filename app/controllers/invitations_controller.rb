class InvitationsController < ApplicationController
  before_action :set_invitation, only: %i[ accept unaccept show edit update destroy ]
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
  end
  def accept
    invitee = @invitation.invitee
    if @invitation.update(accepted: true)
      flash[:success] = "Accepted invitation!"
      redirect_to user_path(invitee)
    else
      flash[:warning] = "could not accept for some reason"
      redirect_to user_path(invitee)
    end
  end
  def unaccept
    invitee = @invitation.invitee
    if @invitation.update(accepted: false)
      flash[:success] = "Unaccepted invitation!"
      redirect_to user_path(invitee)
    else
      flash[:warning] = "could not accept for some reason"
      redirect_to user_path(invitee)
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
