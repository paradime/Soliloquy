# "Follow" is a model that represents the connection from on Thinker to another
class Follow < ActiveRecord::Base

  # A given "follow" has one follower and one followee. Both are Thinkers models.
  belongs_to :follower, :foreign_key => "follower_id", :class_name => "Thinker"
  belongs_to :followee, :foreign_key => "followee_id", :class_name => "Thinker"

  # Auto-pluralization?!? Note that rails pluralizes and singularizes tables and classes for you.

  # Though it's not defined, the primary key for Follow is "id" by default in Rails.
  # Note: schema.rb does not define an "id" field explicitly, but it is created by default for all tables.

end
