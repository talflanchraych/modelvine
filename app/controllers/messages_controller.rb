class MessagesController < ApplicationController

  # GET /message/new
  def new
    @message = Message.new
  end
 
  # POST /message/create
  def create
    recipient = User.find(params["message"]["id"])
    subject = params["message"]["subject"]
    body = params["message"]["body"]
    current_user.send_message(recipient, body, subject)
    flash[:notice] = "Message has been sent!"
    redirect_to :conversations
  end

  private

  def message_params
    params.require(:message).permit(:id, :subject, :body)
  end

end
