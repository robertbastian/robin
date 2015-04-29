class AddColumnPointsToSolutions < ActiveRecord::Migration
  def change
  	add_column :solutions, :points, :integer
  	add_column :solutions, :title, :string
  end
end
