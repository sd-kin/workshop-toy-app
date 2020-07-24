class UsersController < ApplicationController
  def new
    @form = SignUp.new
  end

  def create
    form = SignUp.new(**user_params)

    if form.valid?
      user = Users::Create.new(**form.user_attributes).call

      redirect_to user_path(user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params
      .require(:sign_up)
      .permit(%i[username address email email_confirmation check])
      .to_h
      .symbolize_keys
  end
end
