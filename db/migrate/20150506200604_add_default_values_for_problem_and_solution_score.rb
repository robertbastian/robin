class AddDefaultValuesForProblemAndSolutionScore < ActiveRecord::Migration
  def change
	change_column_default :problems, :score, 0
	change_column_default :solutions, :score, 0
  end
end
