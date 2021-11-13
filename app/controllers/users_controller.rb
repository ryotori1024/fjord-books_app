class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def index
    @users = User.order(:id).page(params[:page]).per(5)
  end

  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end
