class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.string :destination
      t.date :departure_date
      t.date :return_date
      t.integer :members
      t.string :name
      t.date :day_1
      t.datetime :time_1
      t.string :location_1
      t.text :description_1
      t.date :day_2
      t.datetime :time_2
      t.string :location_2
      t.text :description_2
      t.date :day_3
      t.datetime :time_3
      t.string :location_3
      t.text :description_3
      t.date :day_4
      t.datetime :time_4
      t.string :location_4
      t.text :description_4
      t.date :day_5
      t.datetime :time_5
      t.string :location_5
      t.text :description_5
      t.date :day_6
      t.datetime :time_6
      t.string :location_6
      t.text :description_6
      t.date :day_7
      t.datetime :time_7
      t.string :location_7
      t.text :description_7
      t.references :user, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end

