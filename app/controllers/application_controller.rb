class ApplicationController < ActionController::API
  include UsersHelper
  include Response
  include ErrorResponse
  include Authentication

end
