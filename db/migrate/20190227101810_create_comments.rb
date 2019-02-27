# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :post
      t.string :body
      t.references :user
      t.timestamps
    end
  end
end
