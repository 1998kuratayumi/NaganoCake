class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
       redirect_to admin_end_users_path
    else
       render :edit
    end
  end

  private
  def end_user_params
    params.require(:end_user).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:zip_code,:address,:telephone_number,:email,:is_valid)
	end

end
