class ApplicationController < ActionController::API
  include UserHelper
  include Response
  include ErrorResponse
  include Authentication

end
