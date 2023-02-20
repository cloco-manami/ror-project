module Response
  extend ActiveSupport::Concern

  def render_success(data)
    render json: {
      result: 'success',
      data:
    }, status: :ok
  end
end
