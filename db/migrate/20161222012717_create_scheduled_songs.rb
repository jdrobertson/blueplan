class CreateScheduledSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :scheduled_songs do |t|
      t.integer :event_id
      t.integer :song_id
      t.integer :schedule_position

      t.timestamps
    end
  end
end
