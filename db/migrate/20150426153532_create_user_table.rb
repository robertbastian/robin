class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :user_tables do |t|
      t.string :username
      t.integer :score, default: 0
    end
  end
end
