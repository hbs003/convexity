class SubscribersController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @subscriber = Subscriber.new
  end
  def create
    subscriber = Subscriber.new(subscriber_params)
    if subscriber.valid?
      subscriber.save
      flash[:success] = "You have subscribed successfully"
    else
      flash[:error] = "Problem in subscription: #{subscriber.errors.full_messages.join(', ')}"
    end
    redirect_to root_path
  end

  private
  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
