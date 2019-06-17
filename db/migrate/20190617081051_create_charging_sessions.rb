class CreateChargingSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :charging_sessions do |t|
      t.references :charging_post, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamp :start_time
      t.timestamp :end_time

      t.timestamps
    end
  end
end
