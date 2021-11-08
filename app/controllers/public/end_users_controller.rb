class Public::EndUsersController < ApplicationController
  def index
  end
  def show
    @end_user = current_end_user
  end

  def update
    @end_user = current_end_user
    @end_user.update(end_user_params)
    redirect_to end_users_path
  end

  def edit
    @end_user = current_end_user
  end

  def quit
  end

  def out
    @end_user = current_end_user
      @end_user.update(is_valid: false)
      #ログアウトさせる
      reset_session
  end
  
  private
  def end_user_params
    params.require(:end_user).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:zip_code,:address,:telephone_number,:email,:is_valid)
	end 
end
