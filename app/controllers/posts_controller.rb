# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    ## We have a scope defined in the Post model, so we will use that here.

    ## I have also used the #includes method here to avoid the N+1 problem,
    ## taking the number of queries for this action to just 2 instead of
    ## the hundreds it was before.
    @posts = Post.published.includes(:user)

    ## Since it is a big security risk here interpolating input from
    ## our incoming params, I will refactor this to have more direct control
    ## of what method we are using for our AR call. To try and keep some
    ## of the model logic out of the controller, I have moved the if/else
    ## statement that decides which order scope to use to the Post model class.
    if %w[asc desc].include?(params[:sort])
      @posts = @posts.order_by(params[:sort])
    end

    ## Since this is only for an HTML mime type we do not necessarily
    ## need the respond_to.
  end

  def show
    @post = Post.find(params[:id])
  end
end
