# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Setty::Application.initialize!

ActionMailer::Base.delivery_method = :smtp  
ActionMailer::Base.raise_delivery_errors = true  
ActionMailer::Base.smtp_settings = { 
  :enable_starttls_auto => true, 
  :address => 'maveral.megiteam.pl',
  :port => 25, 
  :user_name => 'psi@maveral.megiteam.pl',
  :password => 'mietek84',
  :domain => 'maveral.megiteam.pl',
  :authentication => :login }