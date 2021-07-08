class CreateViewingParty < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.integer :movie_api_id
      t.date :date
      t.time :start_time
      t.integer :duration

      t.timestamps
    end
  end
end
