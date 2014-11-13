class Thought < ActiveRecord::Base
  # These relationships define how ActiveRecord models connect to each other via foreign keys.
  # The defaults are used here
  belongs_to :thinker
  has_many :thumbs

  # TODO: Validate that a thought must be unique, and between 5 and 154 characters
  validates :thought, length: { minimum: 5, maximum: 154  }
  #validates :thought, length: { maximum: 154 }
  validates :thought, uniqueness: true
end
