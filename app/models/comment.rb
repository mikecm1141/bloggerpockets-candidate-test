# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  scope :published, -> { where(published: true) }

  ## I've delegated the user's name to comment here to remove the need
  ## for the call in the view.
  delegate :name, to: :user, prefix: true
end
