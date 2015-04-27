class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.text :text
      t.belongs_to :user
      t.belongs_to :problem
      t.timestamps null: false
    end
  end
end
