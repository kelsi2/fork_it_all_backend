class RegistrationsController < ApplicationController
  skip_before_action :restrict_access

  def create
    @user = User.create!(
      email: params['email'],
      password: params['password'],
      password_confirmation: params['password'],
      name: params['name'],
      handle: params['handle'],
      access_token: SecureRandom.hex
    )

    if @user
      render json: {
        status: :created,
        user: @user
      }
    else
      render json: { status: 500 }
    end
  end
end
