class UsersController < ApplicationController
  # before_action :authenticate_user, except: %i[create]
  require 'bcrypt'

  def index
    @users = User.all
  end

  def create
    form = UserCreateForm.new(params)
    return error_validation(form.errors) if form.invalid?

    puts form.first_name

    @user = User.new
    @user.first_name = form.first_name
    @user.last_name = form.last_name
    @user.first_name_kana = form.first_name_kana
    @user.last_name_kana = form.last_name_kana
    @user.gender = form.gender
    @user.email = form.email
    @user.password = BCrypt::Password.create(form.password)
    @user.birth_date = form.birth_date
    @user.height = form.height
    @user.weight = form.weight
    @user.set_age(@user.birth_date)
    @user.token = Digest::UUID.uuid_v4

    return error_validation(@user.errors) if @user.invalid?

    @user.save!

  end

  def show
    @user = User.find(params[:id])
    # @user = @current_user
  end

  def update
    form = UserUpdateForm.new(params)
    error_validation(form.errors) if form.invalid?

    @user = User.find(params[:id])
     # @user = @current_user

    @user.first_name = form.first_name unless form.first_name.nil?
    @user.last_name = form.last_name unless form.last_name.nil?
    @user.first_name_kana = form.first_name_kana unless form.first_name_kana.nil?
    @user.last_name_kana = form.last_name_kana unless form.last_name_kana.nil?
    @user.gender = form.gender unless form.gender.nil?
    @user.email = form.email unless form.email.nil?
    @user.password = BCrypt::Password.create(form.password) unless form.password.nil?
    @user.birth_date = form.birth_date unless form.birth_date.nil?
    @user.height = form.height unless form.height.nil?
    @user.weight = form.weight unless form.weight.nil?
    @user.set_age(@user.birth_date)

    return error_validation(@user.errors) if @user.invalid?

    @user.save!

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
end
