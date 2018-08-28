class InvestmentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.investment_mailer.confirmation.subject
  #
  def confirmation(investment)
    @investment = investment

    mail(to: @investment.user.email, subject: 'Confirmação de Investimento')
  end
end
