class UsersController < ApiController
  before_action :authorized, only: [:auto_login]

  # LOGGING IN
  def login
    @user = User.find_for_authentication(email: params[:email])

    if not @user
      return render json: { error: "Invalid username or password" }
    end

    if @user.valid_password?(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    else
      render json: { error: "Invalid username or password" }
    end
  end

  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:username, :password, :age)
  end

end