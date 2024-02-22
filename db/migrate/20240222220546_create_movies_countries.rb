class CreateMoviesCountries < ActiveRecord::Migration[7.1]
  def change
    create_table :movies_countries do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
