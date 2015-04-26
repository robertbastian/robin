class CreateProblemTable < ActiveRecord::Migration
  def change
    create_table :problem_tables do |t|
      t.belongs_to :user
      t.datetime :date
      t.string :description
      t.integer :score
    end
  end
end
