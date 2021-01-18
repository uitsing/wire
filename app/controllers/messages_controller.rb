class MessagesController < ApplicationController
  before_action :set_room

  def new
    @message = @room.messages.new
  end

  def create
    @message = @room.messages.create!(message_params)

    # respond_to do |format|
      # format.turbo_stream
      # format.html { redirect_to @room }
    # end
  end

  def edit
    @message = @room.messages.find(params[:id])
  end

  def update
    @message = @room.messages.find(params[:id])
    if @message.update(message_params)
      redirect_to @room
    else
      render :edit
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
