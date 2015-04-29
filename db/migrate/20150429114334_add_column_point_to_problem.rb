class AddColumnPointToProblem < ActiveRecord::Migration
  def change
  	add_column :problems, :points, :integer
  end
end
