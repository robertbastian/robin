class Solution < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem
  after_initialize :default_values

  private
    def default_values
      self.score ||= 0
    end
end
