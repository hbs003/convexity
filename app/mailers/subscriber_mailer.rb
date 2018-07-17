class SubscriberMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscriber_mailer.welcome.subject
  #
  def welcome(subscriber)
    @subscriber = subscriber  # Instance variable => available in view

    mail(to: @subscriber.email, subject: 'Welcome to TravelTips')
    # This will render a view in `app/views/user_mailer`!
  end


end
