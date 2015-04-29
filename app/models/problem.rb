class Problem < ActiveRecord::Base
  belongs_to :author, foreign_key: 'user_id', class_name: 'User'
  has_many :solutions
end
