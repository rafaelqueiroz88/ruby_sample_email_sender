#!/usr/bin/ruby
require_relative 'email_sender'

sender = EmailSenderModule.new

puts "Endereço: "
address = gets.chomp
sender.set_to_address address

puts "Assunto: "
subject = gets.chomp
sender.set_subject subject

puts "Message: "
message = gets.chomp
sender.set_message message

sender.send_email