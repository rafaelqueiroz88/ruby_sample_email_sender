#!/usr/bin/ruby
require 'pony'
require 'dotenv'
Dotenv.load '.env'

class EmailSenderModule

  def initialize
    set_configuration
  end

  def set_message message
    @message = message
  end

  def set_subject subject
    @subject = subject
  end

  def set_to_address to_address
    @to_address = to_address
  end

  def send_email
    Pony.mail(
      :to             => @to_address,
      :via            => :smtp,
      :subject        => @subject,
      :body           => @message,
      :via_options    => {
        :user_name      => @setup[0],
        :password       => @setup[1],
        :address        => @setup[2],
        :port           => @setup[3],
        :authentication => :plain,
        :domain         => @setup[4]
      }
    )
  end

  private
    def set_configuration
      @setup = [ENV["mail_address"], ENV["mail_password"], ENV["email_server"], ENV["port"], ENV["domain"]]
    end
end