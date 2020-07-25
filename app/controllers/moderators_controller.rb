class ModeratorsController < ApplicationController
  before_action :check_current_user, only: [:edit, :update]
  before_action :check_for_ownership, only: [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @form = ModeratorSignUpForm.new
  end

  def create
    @form = ModeratorSignUpForm.new(**sign_up_params)

    if @form.valid?
      user = UserMutator.create_moderator_user(**@form.user_attributes)

      redirect_to moderator_path(user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    user_attributes = @user
      .attributes
      .symbolize_keys
      .slice(:username, :email, :address, :workplace, :profession, :banned, :deleted)

    @form = EditModeratorForm.new(**user_attributes)
  end

  def update
    @form = EditModeratorForm.new(**update_params)
    @user = User.find(params[:id])

    if @form.valid?
      UserMutator.update_moderator_user(@user, **@form.user_attributes)

      redirect_to moderator_path(@user)
    else
      render :edit
    end
  end

  private

  def check_for_ownership
    return if @current_user.moderator?

    redirect_to(moderators_path, notice: 'You not to allowed to edit other users')
  end

  def check_current_user
    return if @current_user

    redirect_to(moderators_path, notice: 'You need to sign in')
  end

  def sign_up_params
    params
      .require(:moderator_sign_up_form)
      .permit(%i[username address email email_confirmation workplace profession check])
      .to_h
      .symbolize_keys
  end

  def update_params
    params
      .require(:edit_moderator_form)
      .permit(%i[username address email workplace profession banned deleted])
      .to_h
      .symbolize_keys
  end
end
