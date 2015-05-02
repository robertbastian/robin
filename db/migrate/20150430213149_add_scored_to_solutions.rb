class AddScoredToSolutions < ActiveRecord::Migration
  def change
    add_column :solutions, :scored, :boolean, default: false
  end
end
