# DELETE ME!!

class MessagesController < ApplicationController

  # # GET /message/new
  # def new
  #   @message = Message.new
  # end
 
  # # POST /message/create
  # def create
  #   recipient = User.find(params["message"]["id"])
  #   subject = params["message"]["subject"]
  #   body = params["message"]["body"]
  #   current_user.send_message(recipient, body, subject)
  #   flash[:notice] = "Message has been sent!"
  #   redirect_to :conversations
  # end

  # def send_message
  #   @user = User.find(params[:user_id])
  #   @message = params[:message]
  #   @subject = params[:subject]
  #   current_user.send_message(@user, "#{@message}", "#{@subject}")
  #   redirect_to root_path
  # end

  # private

  # def message_params
  #   params.require(:message).permit(:id, :subject, :body)
  # end

end
