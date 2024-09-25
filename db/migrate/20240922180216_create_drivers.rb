# frozen_string_literal: true

class CreateDrivers < ActiveRecord::Migration[7.0]
  def change
    create_table :drivers do |t|
      t.string :email, null: false
      t.string :password, null: false

      t.timestamps
    end
    add_index :drivers, :email, unique: true 
  end
end
