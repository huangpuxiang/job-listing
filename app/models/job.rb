class Job < ApplicationRecord
  validates_presence_of :title, :wage_lower_bound, :wage_upper_bound
  validates :wage_lower_bound, numericality: { greater_than: 0 }
end
