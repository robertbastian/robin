class WinnerColumnToProblem < ActiveRecord::Migration
  def change
  	add_column :problems, :winner_id, :integer
  end
end
