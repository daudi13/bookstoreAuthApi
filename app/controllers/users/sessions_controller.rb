class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(_resource, opts = {})
  render json: {
    message: "User logged in",
    user: current_user
  }, status: :ok
  end

  def respond_to_on_destroy
    log_out_success && return if current_user
    log_out_failed
  end

  def log_out_success
    render json: {
      message: "User logged out",
    }, status: :ok
  end

  def log_out_failed
    render json: {
      message: "your still logged in",
    }, status: :unauthorized
  end
end