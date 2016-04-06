require 'fullcontact'

class Thummim
  def find_valid_emails(emails, umim)
    # valid_emails = []
    webhook_url = "#{ENV['webhook_url']}/umims/#{umim.id}/fullcontact_information_received"
    puts webhook_url
    results = []
    emails.each do |email|
      begin
        result = FullContact.person(email: email, webhookBody: 'json', webhookUrl: webhook_url, webhookId: email)
        results << { email: email, information: result }
        puts email
        # if result.status == 202
        #   puts 'Please wait for 2 minutes and try again'
        # else
        #   puts "#{email} valid"
        #   valid_email = Umim.valid_emails.create(email: email, information: result)
        #   valid_emails.push(valid_email) if valid_email.information.likelihood >= 0.85
        # end
      rescue FullContact::NotFound
        puts "#{email} not valid"
      end
    end
    results.compact
  end

  def find_contact(email)
    FullContact.person(email: email, format: 'json')
  end
end
