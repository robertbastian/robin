class Addexpiry < ActiveRecord::Migration
  def change
  	add_column :problems, :expiry, :datetime
  end
end
