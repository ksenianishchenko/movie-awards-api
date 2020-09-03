class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :imdbId
      t.string :type
      t.string :poster
      t.integer :user_id

      t.timestamps
    end
  end
end
