# Preview all emails at http://localhost:3000/rails/mailers/investment_mailer
class InvestmentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/investment_mailer/confirmation
  def confirmation
    InvestmentMailer.confirmation
  end

end
