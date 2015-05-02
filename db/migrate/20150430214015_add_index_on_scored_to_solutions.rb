class AddIndexOnScoredToSolutions < ActiveRecord::Migration
  def change
	add_index :solutions, :scored
  end
end
