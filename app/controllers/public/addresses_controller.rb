class Public::AddressesController < ApplicationController
 def index
    @addresses = Address.where(end_user_id: current_end_user.id)
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    @address.save
    redirect_to addresses_path, notice: "配送先新規登録を行いました。"
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path, notice: "配送先を更新しました。"
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path, notice: "配送先を削除しました。"
  end
  
  private
    def address_params
      params.require(:address).permit(:postal_code, :address, :name)
    end


end
