class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.references :bookmark, null: false, foreign_key: true, on_delete: :cascade
      t.date :day
      t.time :time
      t.string :location
      t.text :description
      t.timestamps
    end
  end
end
