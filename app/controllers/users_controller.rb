class UsersController < ApplicationController
  before_action :check_if_admin, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @image = user_params[:avatar]
    uploader_checker(@image) if @image
    @user[:avatar_file_name] = @avatar_url
    if @user.save
      log_in @user
      flash[:success] = "Welcome #{user_params[:first_name]} to Zwiggy!"
      MailerWorker.perform_async(@user.id)
      redirect_to root_path
    else
      flash[:error] = "One or more required fields are missing"
      render "new"
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    args = args_params || {}
    if @user
      if !args.nil?
        @orders = @user.orders
        @title = args[:title] || "Profile"
      else
        @orders = @user.orders.order(created_at: :desc).limit(3)
        @title = "Recent Orders"
      end
    else
      flash[:message] = "We're sorry we couldn't find any information for this user."
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Successfully Updated"
      redirect_to @user
    else
      render "edit"
    end
  end

  def upload_image(text)
    @upload = {}
    @upload[:avatar] = Cloudinary::Uploader.upload(text)
    @avatar_url = @upload[:avatar]["url"]
  end

  def destroy
    user = User.find(params[:id])
    if user
      user.destroy
      flash[:success] = "#{user.first_name} has been deleted."
      redirect_to dashboard_path
    else
      flash[:error] = "An error occured. Try deleting #{@user.first_name} again."
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
  end

  def args_params
    args = params.require(:args).permit(:show_all, :title) if params.has_key? "args"
  end

  def uploader_checker(image)
    if image.size < 1.megabytes
      upload_image(image)
    else
      flash[:warning] = "file size must be between 0 and 1 megabytes"
    end
  end
end
