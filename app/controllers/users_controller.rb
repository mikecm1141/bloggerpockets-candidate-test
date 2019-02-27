# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end
end
