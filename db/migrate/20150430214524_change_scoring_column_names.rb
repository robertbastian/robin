class ChangeScoringColumnNames < ActiveRecord::Migration
  def change
	rename_column :problems, :points, :score
	rename_column :solutions, :points, :score
	rename_column :solutions, :scored, :has_been_scored
  end
end
