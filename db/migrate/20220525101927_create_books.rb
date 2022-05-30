# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      ## Database authenticatable
      t.string :title
      t.string :body
      t.integer :user_id

      t.timestamps null: false
    end


    # add_index :books, :confirmation_token,   unique: true
    # add_index :books, :unlock_token,         unique: true
  end
end
