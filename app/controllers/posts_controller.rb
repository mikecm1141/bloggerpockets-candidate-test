# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    ## We have a scope defined in the Post model, so we will use that here.

    ## I have also used the #includes method here to avoid the N+1 problem,
    ## taking the number of queries for this action to just 2 instead of
    ## the hundreds it was before.
    @posts = Post.published.includes(:user)

    if params[:sort].present?
      @posts = @posts.order("created_at #{params[:sort]}")
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
