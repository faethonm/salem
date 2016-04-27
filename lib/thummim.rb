require 'fullcontact'

class Thummim
  def find_valid_emails(emails, umim)
    # valid_emails = []
    webhook_url = "#{ENV['webhook_url']}/umims/#{umim.id}/fullcontact_information_received"
    emails.each do |email|
      find_result(email, webhook_url)
    end
  end

  def find_contact(email)
    FullContact.person(email: email, format: 'json').to_snake_keys
  rescue
    nil
  end

  def find_result(email, webhook_url)
    FullContact.person(email: email,
                       webhookBody: 'json',
                       webhookUrl: webhook_url,
                       webhookId: email
                      )
  end
end
