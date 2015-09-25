class Social::MessagesController < ApplicationController
  before_action :authenticate_user!
  require 'Mailboxer'

  def new
    @recipient = User.find_by_uuid(params[:to])
    if current_user.uuid == @recipient.uuid
      flash[:error] = t('errors.messages.not_allowed')

      redirect_to :back
    end
  end

  def create
    recipient = User.find_by(params['recipient'])

    conversation = Mailboxer::Conversation.participant(current_user).participant(recipient).first
    if conversation.blank?
      conversation = current_user.send_message(recipient, params[:message][:body], recipient.id).conversation
    else
      current_user.reply_to_conversation(conversation, params[:message][:body])
    end
    flash[:success] = "Message has been sent!"
    redirect_to social_conversation_path(conversation)
  end
end