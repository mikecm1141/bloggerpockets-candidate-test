# frozen_string_literal: true

class CommentsController < ApplicationController
  def index
    ## Using the #includes method here to reduce number of queries to the
    ## DB. This will only query the DB 3 times to gather the post, its comments,
    ## and the users for those comments.
    @post = Post.includes(comments: :user).find(params[:post_id])
  end
end
