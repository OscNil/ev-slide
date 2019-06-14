class CreateChargingPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :charging_posts do |t|

      t.timestamps
    end
  end
end
