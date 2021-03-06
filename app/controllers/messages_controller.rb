class MessagesController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @message = Message.new
  end
  def create
    @message = Message.new(message_params)
    if @message.save
      MessageMailer.contact(@message).deliver_now
      redirect_to message_path
      flash[:notice] = "Recebemos sua mensagem e entraremos em contato!"
    else
      flash[:notice] = "Ocorreu um erro. Tente novamente."
      render :new
    end
  end
  private
  def message_params
    params.require(:message).permit(:name, :email, :phone, :body)
  end
end
