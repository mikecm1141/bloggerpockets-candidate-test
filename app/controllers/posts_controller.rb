# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :gather_posts, only: :index
  def index
    respond_to do |format|
      format.html
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def gather_posts
    ## We have a scope defined in the Post model, so we will use that here.

    ## I have also used the #includes method here to avoid the N+1 problem,
    ## taking the number of queries for this action to just 2 instead of
    ## the hundreds it was before.
    @posts = Post.published.includes(:user)

    if params[:sort].present?
      ## Since it is a big security risk here interpolating input from
      ## our incoming params, I will refactor this to have more direct control
      ## of what method we are using for our AR call. I will also implement
      ## two new scopes to use instead here.
      if params[:sort] == 'asc'
        @posts = @posts.sort_by_oldest
      elsif params[:sort] == 'desc'
        @posts = @posts.sort_by_newest
      end
    end
  end
end
