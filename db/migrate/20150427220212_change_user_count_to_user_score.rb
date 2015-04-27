class ChangeUserCountToUserScore < ActiveRecord::Migration
  def change
	rename_column :users, :count, :score
  end
end
