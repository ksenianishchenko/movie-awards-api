class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :type, :movie_type
  end
end
