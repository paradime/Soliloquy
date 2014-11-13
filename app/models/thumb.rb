class Thumb < ActiveRecord::Base

  # These relationships define how ActiveRecord models connect to each other via foreign keys.
  # The defaults are used here
  belongs_to :thinker
  belongs_to :thought

  # TODO: Extra credit. Validate that a single thumb must be unique to a thinker. Hint: look up 'scope'.
  # Provide the message: 'You've thumbed this already!
end
