class CreateFilmingLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :filming_locations do |t|
      t.string :location

      t.timestamps
    end
  end
end
