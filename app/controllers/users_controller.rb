# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    ## We can remove the 2nd instance variable since we have the relation
    ## specified for Posts in our User model.
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
      ## Before this simply outputted the user's entire information in JSON
      ## format. I think to better reflect what this action does in its HTML
      ## view, I have refactored it just to include the user's id and name,
      ## excluding information such as the password_digest field. It also
      ## includes the user's posts to also reflect what the HTML view gives.

      ## I would normally use a serializer for this purpose to give even
      ## greater control, but did not feel the need for that in this challenge.
      format.json do
        render json: { id: @user.id, name: @user.name, posts: @user.posts }
      end
    end
  end
end
