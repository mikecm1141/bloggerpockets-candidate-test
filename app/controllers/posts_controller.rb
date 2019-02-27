# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.where(published: true)

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
end
