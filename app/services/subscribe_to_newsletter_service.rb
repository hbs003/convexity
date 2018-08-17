require 'digest'
class SubscribeToNewsletterService
  def initialize(subscriber)
    @subscriber = subscriber
    @gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    @list_id = ENV['MAILCHIMP_LIST_ID']
    @lower_case_md5_hashed_email_address = Digest::MD5.hexdigest(subscriber.email.downcase)
  end

  def call
    @gibbon.lists(@list_id).members(@lower_case_md5_hashed_email_address).upsert(body: {email_address: @subscriber.email, status: "subscribed"})

      # @gibbon.lists(@list_id).members.create(
      #   body: {
      #     email_address: @subscriber.email,
      #     status: "subscribed",
      #     update_existing: true
      #   }
      # )

  end





end
