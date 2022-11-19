class UserController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = current_user
  end
end
