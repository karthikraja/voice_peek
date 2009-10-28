# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '939a9a59dcd018c5c10288a4f36f4ba3'
  
  # Be sure to include AuthenticationSystem in Application Controller instead
   include AuthenticatedSystem
  
end
