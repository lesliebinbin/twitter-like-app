class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update destroy following followers]
  before_action :correct_user, only: %i[edit update]
  before_action :admin_user, only: :destroy
  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.json do
        render json: (current_user.admin? ? @users : @users.map { |user| user.slice(:email, :name) })
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.json do
        render json: current_user.admin? ? @user : @user.slice(:email, :name)
      end
    end
    # debugger
  end

  def edit
    @user = User.find(params[:id])
  end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     log_in @user
  #     flash[:success] = 'Welcome to the Sample App!'
  #     redirect_to @user
  #   else
  #     render 'new'
  #   end
  # end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = 'Please check your email to activate the account'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to users_url
  end

  def following
    @title = 'Following'
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    respond_to do |format|
      format.html { render 'show_follow' }
      format.json { render json: @users.map { |user| user.slice(:name, :email) } }
    end
  end

  def followers
    @title = 'Followers'
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    respond_to do |format|
      format.html { render 'show_follow' }
      format.json { render json: @users.map { |user| user.slice(:name, :email) } }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    redirect_to(root_url) unless current_user?(User.find(params[:id]))
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
