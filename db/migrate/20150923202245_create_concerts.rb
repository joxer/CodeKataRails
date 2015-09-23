class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :position
      t.references :band, index: true, foreign_key: true
      t.string :location

      t.timestamps null: false
    end
  end
end
