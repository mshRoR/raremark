class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :suspend, :reactivate, :delete ]

  # GET    /users
  def index
    @users = User.includes(:profile => [:country], :disease_histories => [:disease]).where(deleted_at:nil, suspended_at:nil)
  end

  # # GET /users/:id
  def show
    @user =  User.includes(:disease_histories => [:disease]).find(params[:id])
  end

  # GET    /users/new
  def new
    @user = User.new
    @profile = @user.build_profile
    @disease_histories = @user.disease_histories.build
    @countries = Country.all
    @diseases = Disease.all
  end

  # GET /users/:id/edit
  def edit
    @countries = Country.all
    @diseases = Disease.all
  end
 
  # POST   /users
  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save!
      flash[:notice] = "User registration successful!"
      redirect_to user_path(@user)
    else
      @profile = @user.build_profile
      @disease_histories = @user.disease_histories.build
      @countries = Country.all
      @diseases = Disease.all
      render :new
    end
  end

  # PATCH/PUT  /users/:id
  def update
    if  @user.assign_attributes(user_params)
      @user.update!(user_params)
      flash[:notice] = "User update successful!"
      redirect_to user_path(@user)
    else
      flash.now[:notice] = "Fillup all the fields properly to update the user!"
      @countries = Country.all
      @diseases = Disease.all
      render :edit
    end
  end

  # DELETE /users/:id
  def destroy
  end

  # PUT /users/:id/suspend
  def suspend
    if @user.suspended_at.nil?
      flash[:notice] = "User suspend successful!"
      @user.update(suspended_at: Time.now)
      redirect_to users_path
    else
      flash[:notice] = "User already suspended!"
      redirect_to users_path
    end
  end

  # PUT /users/:id/reactivate
  def reactivate
    if @user.suspended_at.present?
      flash[:notice] = "User reactivate successful!"
      @user.update(suspended_at: nil)
      redirect_to users_path
    else
      flash[:notice] = "User already activated!"
      redirect_to users_path
    end
  end

  # PUT /users/:id/delete
  def delete
    if @user.deleted_at.nil?
      flash[:notice] = "User delete successful!"
      @user.update(deleted_at: Time.now)
      redirect_to users_path
    else
      flash[:notice] = "User already deleted!"
      redirect_to users_path
    end
  end

  # GET /users/suspended
  def suspended
    @users = User.includes(:profile => [:country], :disease_histories => [:disease]).where("suspended_at is not NULL")
  end

  # GET /users/deleted/
  def deleted
    @users = User.includes(:profile => [:country], :disease_histories => [:disease]).where("deleted_at is not NULL")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user =  User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, profile_attributes: [:id, :gender, :born_year, :born_month, :country_id, :profile_type], disease_histories_attributes: [:id, :disease_id, :_destroy] )
    end

end
