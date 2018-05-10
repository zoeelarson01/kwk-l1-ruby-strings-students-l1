# require_relative "./spec/spec_helper.rb"
# require 'require_all'


print "Hi, you've been invited to a party! What is your name? "
guest_name = gets.chomp

print "What was the name of this party? "
party_name = gets.chomp

print "What is the date of this party? "
date = gets.chomp

print "What time is this party? "
time = gets.chomp

print "What is the name of the host? "
host_name = gets.chomp



puts "Dear #{guest_name},

You are cordially invited to the #{party_name} on #{date} at #{time}. Please RSVP no later than October 30.

Sincerely,

#{host_name}"
