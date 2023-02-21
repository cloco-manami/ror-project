module Authentication
  extend ActiveSupport::Concern

  def authenticate_user
    return error_unauthorized if request.headers['token'].nil?

    user = User.where(token: request.headers['token']).first
    return error_unauthorized if user.nil?

    return response_conflict unless user.id == @current_user

    @current_user = user
  end
end
