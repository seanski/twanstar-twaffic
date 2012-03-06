class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :location
      t.string :description
      t.integer :vehicles
      t.string :lanes
      t.string :status
      t.datetime :reported_at
      t.float :latitude
      t.float :longitude

      t.timestamps

    end

    add_index :incidents, [:latitude, :longitude, :reported_at, :vehicles, :status, :description], name: "collision_index", unique: true
  end
end
