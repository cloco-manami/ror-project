class UsersController < ApplicationController
  before_action :authenticate_user, except: %i[create]
  require 'bcrypt'

  def index
    @users = User.all
  end

  def create
    form = UserCreateForm.new(params)
    return error_validation(form.errors) if form.invalid?

    Rails.logger.debug form.first_name

    @user = User.new
    @user.first_name = form.first_name
    @user.last_name = form.last_name
    @user.first_name_kana = form.first_name_kana
    @user.last_name_kana = form.last_name_kana
    @user.gender = form.gender
    @user.email = form.email
    @user.phone_number = form.phone_number
    @user.password = BCrypt::Password.create(form.password)
    @user.birth_date = form.birth_date
    @user.height = form.height
    @user.weight = form.weight
    @user.age_calculate(@user.birth_date)
    @user.token = Digest::UUID.uuid_v4

    return error_validation(@user.errors) if @user.invalid?

    @user.save!
  end

  def show
    @user = @current_user
  end

  def update
    form = UserUpdateForm.new(params)
    return error_validation(form.errors) if form.invalid?

    @user = @current_user

    @user.first_name = form.first_name if form.first_name.present?
    @user.last_name = form.last_name if form.last_name.present?
    @user.first_name_kana = form.first_name_kana if form.first_name_kana.present?
    @user.last_name_kana = form.last_name_kana if form.last_name_kana.present?
    @user.gender = form.gender if form.gender.present?
    @user.email = form.email if form.email.present?
    @user.phone_number = form.phone_number if form.phone_number.present?
    @user.password = BCrypt::Password.create(form.password) if form.password.present?
    @user.birth_date = form.birth_date if form.birth_date.present?
    @user.height = form.height if form.height.present?
    @user.weight = form.weight if form.weight.present?
    @user.age_calculate(@user.birth_date)

    return error_validation(@user.errors) if @user.invalid?

    @user.save!
  end

  def destroy
    @user = @current_user
    @user.destroy
  end
end
