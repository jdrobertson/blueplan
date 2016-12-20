class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.time :time
      t.date :date
      t.text :description
      t.integer :details_id
      t.timestamps
    end
  end
end
