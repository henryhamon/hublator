class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery :secret => '3cb3db0185c62c9e8ff82b617f6e000e'
  
  layout 'pbt'

end

class BackstageApplicationController < ApplicationController
  include AuthenticatedSystem

  before_filter :login_required

  layout 'backstage'
end
