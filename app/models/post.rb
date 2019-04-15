# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates_presence_of :title
  validates_presence_of :body

  scope :published, -> { where(published: true) }
  scope :sort_by_newest, -> { order(created_at: :desc) }
  scope :sort_by_oldest, -> { order(created_at: :asc) }

  ## As in the Comment model, I have delegated the User's name to the Post
  ## model to further clean up the view.
  delegate :name, to: :user, prefix: true

  def self.order_by(sort_value)
    if sort_value == 'asc'
      self.sort_by_oldest
    elsif sort_value == 'desc'
      self.sort_by_newest
    end
  end
end
