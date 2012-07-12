# Load the rails application
require File.expand_path('../application', __FILE__)

::FT = GData::Client::FusionTables.new

file = File.new("options.txt", "r")
username = file.gets
password = file.gets

::FT.clientlogin(username, password)
ENV['question_table'] = ::FT.show_tables.select{|t| t.name == "Question_Locations"}.first.id
ENV['challenge_table'] = ::FT.show_tables.select{|t| t.name == "Challenge_Locations"}.first.id
ENV['event_table'] = ::FT.show_tables.select{|t| t.name == "Event_Locations"}.first.id
ENV['csb_locations'] = 2036527.to_s

#initialize constants for popularity sort
ENV['response_value'] = 1.to_s
ENV['followed_value'] = 2.to_s

ENV['flickr_key'] = '0e12c19d5c18caa1ecd517dfc948cbcb'
ENV['flickr_secret'] = 'fef74b57f03f9477'
ENV['token_cache'] = "token_cache.yml"
ENV['auth_token'] = '72157628109269099-93e1d91f41867015'

@why_not_global = 2

Fleakr.api_key = ENV['flickr_key']
Fleakr.shared_secret = ENV['flickr_secret']
Fleakr.auth_token = ENV['auth_token']

#config.action_mailer.delivery_method = :smtp

#ActionMailer::Base.smtp_settings = {
  #:address  => "smtp.someserver.net",
 # :port  => 25,
  #:user_name  => "someone@someserver.net",
  #:password  => "mypass",
  #:authentication  => :login
#}

#config.action_mailer.raise_delivery_errors = true

# Initialize the rails application
Citysandbox::Application.initialize!
