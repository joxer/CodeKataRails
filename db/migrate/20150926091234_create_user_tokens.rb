class CreateUserTokens < ActiveRecord::Migration
  def change
    create_table :user_tokens do |t|
      t.string :token
      t.date :start_date
      t.date :end_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
