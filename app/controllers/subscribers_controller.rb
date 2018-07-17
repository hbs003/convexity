class SubscribersController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @subscribers = Subscriber.all.order("created_at DESC")
  end
  def new
    @subscriber = Subscriber.new
  end
  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.valid?
      @subscriber.save
      flash[:success] = "Parabéns, sua inscrição foi um sucesso!"
    else
      flash[:error] = "Houve um erro na sua inscrição: #{@subscriber.errors.full_messages.join(', ')}"
    end
    redirect_to root_path
  end

  private
  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
