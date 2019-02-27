# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user
      t.string :title
      t.text :body
      t.boolean :published
      t.timestamps
    end
  end
end
