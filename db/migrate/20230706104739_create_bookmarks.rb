class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.string :destination
      t.date :departure_date
      t.date :return_date
      t.integer :members
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.date :day, null: false
      t.time :time, null: false
      t.string :location, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
