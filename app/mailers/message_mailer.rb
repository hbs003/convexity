class MessageMailer < ApplicationMailer

  def contact(message)
    @message = message

    mail to: "henrique.silva@gosengenharia.com"
  end
end
