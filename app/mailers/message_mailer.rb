class MessageMailer < ApplicationMailer

  def contact(message)
    @message = message

    mail to: "hbs003@hotmail.com"
  end
end
