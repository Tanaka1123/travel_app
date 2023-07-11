class CreateBookmarkDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmark_details do |t|
      t.references :bookmark, null: false, foreign_key: true
      t.date :day, null: false
      t.time :time, null: false
      t.string :location, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
