class Problem < ActiveRecord::Base
  belongs_to :author, foreign_key: 'user_id', class_name: 'User'
  belongs_to :winner, foreign_key: 'winner_id', class_name: 'User'
  has_many :solutions
  after_initialize :default_values

  private
    def default_values
      self.score ||= 0
    end
end
