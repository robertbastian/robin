class Problem < ActiveRecord::Base
  belongs_to :author, foreign_key: 'user_id', class_name: 'User'
  belongs_to :winner, foreign_key: 'winner_id', class_name: 'User'
  has_many :solutions
  # attr_default :points, 0
end
