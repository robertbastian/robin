class Solution < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem
  attr_default :points, 0
end
