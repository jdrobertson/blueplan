class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: new_session_params[:email].downcase)
    if user && user.authenticate(new_session_params[:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def new_session_params
    params.require(:session).permit(:email, :password)
  end
end
