require "fullcontact"

class Validator

  def find_valid_emails(permutator, emails)
    valid_emails = []
    emails.each do |email|
      begin
        result = FullContact.person(email: email)
        if result.status ==202
          debugger
          puts "Please wait for 2 minutes and try again"
        else
          puts "#{email} valid"
          valid_email = permutator.valid_emails.create(email: email, information: result)
          valid_emails.push(valid_email) if valid_email.information.likelihood >= 0.85
        end
      rescue FullContact::NotFound
        puts "#{email} not valid"
      end
    end
    valid_emails
  end

  def find_social_info(email)
    begin
      FullContact.person(email: email)
    rescue FullContact::NotFound
      puts "#{email} not valid"
    end
  end
end
