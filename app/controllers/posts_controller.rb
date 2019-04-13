# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    ## We have a scope defined in the Post model, so we will use that here.

    ## I have also used the #includes method here to avoid the N+1 problem,
    ## taking the number of queries for this action to just 2 instead of
    ## the hundreds it was before.
    @posts = Post.published.includes(:user)

    if params[:sort].present?
      ## Since it is a big security risk here interpolating input from
      ## our incoming params, I will refactor this to have more direct control
      ## of what method we are using for our AR call.
      if params[:sort] == 'asc'
        @posts = @posts.order(created_at: :asc)
      elsif params[:sort] == 'desc'
        @posts = @posts.order(created_at: :desc)
      end
    end

    respond_to do |format|
      format.html
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def comments
    @post = Post.find(params[:id])
    @comments = @post.comments
  end
end
