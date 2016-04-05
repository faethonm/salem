require 'fullcontact'

class Validator
  def find_valid_emails(emails,permutator)
    # valid_emails = []
    webhook_url = "http://df6955b2.ngrok.io/permutators/#{permutator.id}/fullcontact_information_received"
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
        #   valid_email = permutator.valid_emails.create(email: email, information: result)
        #   valid_emails.push(valid_email) if valid_email.information.likelihood >= 0.85
        # end
      rescue FullContact::NotFound
        puts "#{email} not valid"
      end
    end
    results.compact
  end

  def find_contact(email)
    FullContact.person(email: email, style: 'dictionary')
  end
end
