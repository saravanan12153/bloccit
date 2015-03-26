class Topic < ActiveRecord::Base
  # adding the 'dependent: :destroy' means when topic is deleted, associated posts are deleted too
  has_many :posts, dependent: :destroy

  # Scopes are defined in models and allow access to a group of instances that meet certain criteria
  scope :visible_to, ->(user) { user ? all : where(public: true) }
end