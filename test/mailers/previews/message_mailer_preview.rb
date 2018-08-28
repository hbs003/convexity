# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/contact
  def contact
    message =
  {
    name:'Dishoom',
    phone:'31991148812',
    email:'hbs003@hotmail.com',
    body:'Teste',

  }
    MessageMailer.contact(message)
  end

end
