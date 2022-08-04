class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  include RackSessionFix

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?
    register_failed 
  end

  def register_success
    render json: {
      message: "User created",
      user: current_user
    }, status: :created
  end

  def register_failed
    render json: {
      message: "User not created",
    }, status: :unprocessable_entity
  end
end