# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates_presence_of :title
  validates_presence_of :body

  scope :published, -> { where(published: true) }

  ## As in the Comment model, I have delegated the User's name to the Post
  ## model to further clean up the view.
  delegate :name, to: :user, prefix: true
end
