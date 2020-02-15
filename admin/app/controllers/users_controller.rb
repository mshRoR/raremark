class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET    /users
  def index
    @users = User.all.includes(:profile=> [:country], :disease_histories => [:disease])
    # @users = User.all.includes(:profile => [:country])
  end

  # # GET /users/:id
  def show
  end

  # GET    /users/new
  def new
    @user = User.new
    # @profile = @user.profile.new
  end

  # GET /users/:id/edit
  def edit
  end
 
  # POST   /users
  def create
  end

  # PATCH/PUT  /users/:id
  def update
  end

  # DELETE /users/:id
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {})
    end

end
