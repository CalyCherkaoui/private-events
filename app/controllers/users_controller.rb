class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @events = Event.where(creator_id: @user.id).all
    @attended_events = @user.attended_events
  end

  # ex GET /users/new
  # Get /signup
  def new
    @user = User.new
  end

  # ex POST /users
  # post /signup
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def login
    @user = User.new
  end

  def logout
    session.destroy
    redirect_to events_path
  end

  def auth
    @user = User.find_by(username: params[:username])

    if @user.nil?
      flash[:notice] = 'username not Valid'
      redirect_to login_path
    else
      session[:current_user_id] = @user.id
      session[:current_username] = @user.username
      session[:current_user_fullname] = @user.full_name
      flash[:notice] = 'User Logged in'
      redirect_to user_path(@user)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:full_name, :username)
  end
end
