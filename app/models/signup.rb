class Signup < ApplicationRecord
    validates :time, numericality: {less_than_or_equal_to: 23, greater_than_or_equal_to: 0}
    belongs_to :camper
    belongs_to :activity
end
