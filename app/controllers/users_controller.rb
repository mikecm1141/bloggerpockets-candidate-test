# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    ## We can remove the 2nd instance variable since we have the relation
    ## specified for Posts in our User model.
    @user = User.find(params[:id])
    @posts = @user.posts

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end
end
