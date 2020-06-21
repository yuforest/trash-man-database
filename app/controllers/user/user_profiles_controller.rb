class User::UserProfilesController < User::ApplicationController
  before_action :set_user_profile, only:[:edit, :update]

  def edit
  end

  def update
    if @user_profile.update(user_profile_params)
      flash[:notice] = "編集に成功しました"
      redirect_to root_path
    else
      flash.now[:danger] = "編集に失敗しました"
      render 'edit'
    end
  end

  private
  def user_profile_params
    params.require(:user_profile).permit(:name, :image, :biography)
  end

  def set_user_profile
    @user_profile = current_user.user_profile
  end
end